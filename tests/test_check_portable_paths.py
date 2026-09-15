import os
from pathlib import Path
import subprocess
import tempfile
import unittest

CHECKER = Path(__file__).resolve().parents[1] / "scripts" / "check-portable-paths.sh"


class TestCheckPortablePaths(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.repo = Path(self.temp.name)
        subprocess.run(["git", "init", "-q", str(self.repo)], check=True,
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        subprocess.run(["git", "config", "user.email", "t@t"], cwd=str(self.repo), check=True,
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        subprocess.run(["git", "config", "user.name", "T"], cwd=str(self.repo), check=True,
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    def put(self, path, content, commit=True):
        target = self.repo / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(content)
        subprocess.run(["git", "add", "--", path], cwd=str(self.repo), check=True,
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        if commit:
            subprocess.run(["git", "commit", "-qm", f"add {path}"], cwd=str(self.repo),
                           check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    def run_checker(self, *args):
        return subprocess.run(
            ["sh", str(CHECKER), *args],
            cwd=str(self.repo),
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )

    def test_clean_repo(self):
        self.put("clean.sch", "C {devices/res.sym} 0 0 0 0 {}\n")
        result = self.run_checker()
        self.assertEqual(result.returncode, 0, result.stderr.decode())

    def test_worktree_detects_bad_path_syntaxes(self):
        paths = (
            "/home/user/part.sym",
            "C {/home/user/part.sym}",
            "path=\"/home/user/part.sym\"",
            "path:'/home/user/part.sym'",
            "[/home/user/part.sym]",
            "C {C:\\Users\\user\\part.sym}",
            "C {\\\\server\\share\\part.sym}",
        )
        for index, path in enumerate(paths):
            with self.subTest(path=path):
                self.put(f"bad-{index}.sch", path + "\n")
                result = self.run_checker()
                self.assertEqual(result.returncode, 1)
                self.assertIn(f"bad-{index}.sch".encode(), result.stderr)

    def test_staged_detects_bad_path(self):
        self.put("bad.sch", "C {/home/user/part.sym} 0 0 0 0 {}\n", commit=False)
        result = self.run_checker("--staged")
        self.assertEqual(result.returncode, 1)
        self.assertIn(b"bad.sch", result.stderr)

    def test_staged_ignores_worktree_only_bad(self):
        self.put("clean.sch", "C {devices/res.sym} 0 0 0 0 {}\n")
        (self.repo / "clean.sch").write_text("C {/home/user/bad.sym} 0 0 0 0 {}\n")
        result = self.run_checker("--staged")
        self.assertEqual(result.returncode, 0, result.stderr.decode())

    def test_staged_detects_index_only_bad(self):
        self.put("bad.sch", "C {/home/user/bad.sym} 0 0 0 0 {}\n", commit=False)
        (self.repo / "bad.sch").write_text("C {devices/res.sym} 0 0 0 0 {}\n")
        self.assertEqual(self.run_checker().returncode, 0)
        result = self.run_checker("--staged")
        self.assertEqual(result.returncode, 1)
        self.assertIn(b"bad.sch", result.stderr)

    def test_worktree_catches_uncommitted_bad(self):
        self.put("clean.sch", "C {devices/res.sym} 0 0 0 0 {}\n")
        (self.repo / "dirty.sch").write_text("C {/home/user/bad.sym} 0 0 0 0 {}\n")
        subprocess.run(["git", "add", "dirty.sch"], cwd=str(self.repo), check=True)
        result = self.run_checker()
        self.assertEqual(result.returncode, 1)

    def test_excluded_extensions_pass(self):
        self.put("report.log", "/home/user/something\n")
        result = self.run_checker()
        self.assertEqual(result.returncode, 0)

    def test_bad_flag_rejected(self):
        self.put("clean.sch", "clean\n")
        result = self.run_checker("--bad")
        self.assertEqual(result.returncode, 2)


if __name__ == "__main__":
    unittest.main()
