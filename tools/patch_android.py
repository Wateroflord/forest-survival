"""Настраивает Android-проект: разрешения и название."""
import pathlib, re
ROOT = pathlib.Path("android/app")
m = ROOT / "src/main/AndroidManifest.xml"
t = m.read_text(encoding="utf-8")
for p in ["android.permission.INTERNET", "android.permission.CAMERA", "android.permission.FLASHLIGHT", "android.permission.VIBRATE"]:
    if p not in t:
        t = re.sub(r"(<manifest[^>]*>)", rf'\1\n    <uses-permission android:name="{p}"/>', t, count=1)
t = re.sub(r'android:label="[^"]*"', 'android:label="Выживание в лесу"', t, count=1)

dial = '        <intent>\n            <action android:name="android.intent.action.DIAL"/>\n        </intent>\n'
if "android.intent.action.DIAL" not in t:
    if "<queries>" in t:
        t = t.replace("<queries>", "<queries>\n" + dial.rstrip("\n"), 1)
    else:
        t = t.replace("</manifest>", "    <queries>\n" + dial + "    </queries>\n</manifest>")

m.write_text(t, encoding="utf-8")
print("patched")
