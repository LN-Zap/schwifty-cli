# -*- mode: python ; coding: utf-8 -*-

import os
import site

from PyInstaller.utils.hooks import copy_metadata, collect_data_files

# Get the path to the site-packages directory
site_packages = site.getsitepackages()[0]

# Construct the paths to the schwifty data files
schwifty_bank_registry = os.path.join(site_packages, 'schwifty', 'bank_registry')
schwifty_iban_registry = os.path.join(site_packages, 'schwifty', 'iban_registry')

a = Analysis(
    ['schwifty-cli/__main__.py'],
    pathex=[],
    binaries=[],
    datas = copy_metadata("pycountry")
        + collect_data_files('pycountry')
        + copy_metadata("schwifty")
        + [(schwifty_bank_registry, 'bank_registry')]
        + [(schwifty_iban_registry, 'iban_registry')],
    hiddenimports=["pycountry", "schwifty"],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='schwifty',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
coll = COLLECT(
    exe,
    a.binaries,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='schwifty',
)
