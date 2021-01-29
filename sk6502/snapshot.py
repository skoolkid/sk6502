from skoolkit.snapshot import SnapshotError

# https://vice-emu.sourceforge.io/vice_9.html
VSF_MAGIC = b'VICE Snapshot File\x1a'
MEM_MODULES = (b'C64MEM\x00', b'VIC20MEM\x00')

def can_read(fname):
    return fname[-4:].lower() == '.vsf'

def get_snapshot(fname, page=None):
    with open(fname, 'rb') as f:
        data = f.read()

    if data[:len(VSF_MAGIC)] != VSF_MAGIC:
        raise SnapshotError('{}: Not a VICE snapshot file'.format(fname))

    i = 58
    while i < len(data):
        mod_size = data[i + 18] + 256 * data[i + 19] + 65536 * data[i + 20] + 16777216 * data[i + 21]
        for name in MEM_MODULES:
            if data[i:i + len(name)] == name:
                mem = list(data[i + 26:i + mod_size])
                mem.extend([0] * (65536 - len(mem)))
                return mem
        i += mod_size

    raise SnapshotError('{}: No supported memory module found'.format(fname))
