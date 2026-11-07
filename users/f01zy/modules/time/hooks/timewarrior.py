#!/usr/bin/env python3

import json
import subprocess
import sys

try:
    input_stream = sys.stdin.buffer
except AttributeError:
    input_stream = sys.stdin


def extract_tags(task):
    tags = []
    if "tags" in task:
        raw = task["tags"]
        if isinstance(raw, str):
            tags.extend(t.strip() for t in raw.split(",") if t.strip())
        else:
            tags.extend(raw)
    return tags


def main(old, new):
    started = "start" in new and "start" not in old
    stopped = "start" in old and ("start" not in new or "end" in new)

    if started:
        tags = extract_tags(new)
        cmd = ["timew", "start"] + tags + [":yes"]
        subprocess.call(cmd)
        desc = new.get("description", "")
        if desc:
            subprocess.call(["timew", "annotate", "@1", desc])

    elif stopped:
        subprocess.call(["timew", "stop", ":yes"])

    elif "start" in new and "start" in old:
        old_tags = extract_tags(old)
        new_tags = extract_tags(new)
        if old_tags != new_tags:
            if old_tags:
                subprocess.call(["timew", "untag", "@1"] + old_tags + [":yes"])
            if new_tags:
                subprocess.call(["timew", "tag", "@1"] + new_tags + [":yes"])

        old_desc = old.get("description", "")
        new_desc = new.get("description", "")
        if old_desc != new_desc and new_desc:
            subprocess.call(["timew", "annotate", "@1", new_desc])

if __name__ == "__main__":
    old = json.loads(input_stream.readline().decode("utf-8", errors="replace"))
    new = json.loads(input_stream.readline().decode("utf-8", errors="replace"))
    print(json.dumps(new))
    main(old, new)
