### Downloading Data from Illumina Basespace

#### Step 1: Mounting Basespace

To mount use the `basemount` command, optionally specifying a configuration file that has a log in for a specific account.

  - GENERAL: `basemount --config config_name path/to/mount/at`. 
  - SPECIFIC EXAMPLE: `basemount --config ~/.basespace/coriell_kkeith.cfg basespace`

#### Step 2: Copying Files from Basespace

The only thing to know is to make sure to copy without context, `cp --no-preserve=context`, so that you don't preserve the security settings from Basespace which prevent you from accessing the files.

#### Step 3: Unmounting Basespace

Use the `basemount` command again, this time with the `--umount` flag

-- GENERAL: `basemount --unmout path/to/mount/point`
-- SPECIFIC EXAMPLES: `basemount --unmount /mnt/data/data_kk/basespace`