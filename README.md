# 5e.tools: Meadiocrity Campaign 2

To import all this campaign's available content, go to https://5e.tools and click **Settings > Load State from File**

### Changelog

- rc1 (2023-08-20)
    - Create the Meadiocrity Campaign Companion, a book compiling information about the story and homebrew rules.
    - Update Aarakocra and Fairy homebrew races to add Limited Flight feature.
    - Blocklist backgrounds from Bigby's Glory of the Giants, since they provide feats. Note that feats and classes from BGG are **not** blocklisted.
    - Add approved backgrounds from Sword Coast Adventurer's Guide and Van Richten's Guide to Ravenloft. Note that feats, classes, etc from SCAG and VRGR are still blocklisted.
    - Blocklist races that were updated by Monsters of the Multiverse. Now only the revised versions are shown.
    - Add build system to export a homebrew compendium alongside the statefile.
- beta5 (2023-07-30)
    - Upload to Github and use remote homebrew URL.
- beta4 (2023-07-30)
    - Add +1/+1 option for Myconid to match #"Myconids" FAQ post.
- beta3 (2023-07-30)
    - Add homebrew changes to Aarakocra and Fairy.
    - Add Myconid race and Rapport Spores feat.
    - Use MEAD for Meadiocrity homebrew book ID.
    - Import Ancestral Weapons source.
- beta2 (2023-07-30)
    - Remove Dragonmark races
- beta1 (2023-07-30)
    - Initial release

### Building from local homebrew

- Export a 5e.tools state (Settings > Save State to File)
- Rename as `state.json` and place in the project directory.
- Run `nix develop` and then `make` to split `state.json` into `5etools.json` and `homebrew.json`
