#!/usr/bin/env nix-shell
#! nix-shell --pure -i python3 -p cacert nix python3
import argparse
import json
import subprocess
import os

# Root of the packages directory
ROOT = os.path.dirname(os.path.abspath(__file__))

FETCH_COMMAND = [
	"nix",
	"--extra-experimental-features",
	"'nix-command flakes'",
	"flake",
	"prefetch",
	"--json",
]

# Amazing codegen right?
# Remember to keep this nixfmt compliant, though
PACKAGE_TEMPLATE = """{{ mkCatppuccinDerivation }}:

mkCatppuccinDerivation {{
  pname = "{}";

  portRev = "{}";
  portHash = "{}";
}}
"""


def fetch_port(port: str):
	repo = f"catppuccin/{port}"
	print(f"🔃 Fetching {repo}")
	command = FETCH_COMMAND + [f"github:{repo}"]
	result = subprocess.run(command, capture_output=True, check=True)
	return json.loads(result.stdout)


def write_package(port: str, lock: dict):
	file_path = f"{ROOT}/{port}/package.nix"
	os.makedirs(os.path.dirname(file_path), exist_ok=True)
	print(f"❄️ Creating file {file_path}")

	with open(file_path, "x") as f:
		f.write(PACKAGE_TEMPLATE.format(port, lock["rev"], lock["narHash"]))


parser = argparse.ArgumentParser(prog="init-port")
parser.add_argument("port_name")
args = parser.parse_args()

port = args.port_name
fetched = fetch_port(port)
write_package(port, fetched["locked"])

print("✅ Done!")
