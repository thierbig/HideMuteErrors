# HideMuteErrors
A simple World of Warcraft addon for Wrath of the Lich King (WotLK) 3.3.5a that hides the red UI error text (e.g., "Not enough mana" or "Spell not ready yet") and mutes associated error sounds to reduce distractions during gameplay. The addon includes a toggle command to enable or disable these features.

## Features
- Hides the UI error frame to keep your screen clean.
- Mutes error-related sounds for a quieter experience.
- Provides a toggle command (`/hideerrors on|off`) to show or hide error text and sounds.
- Persistent hiding of error text even if other addons attempt to show it.
- Lightweight and compatible with WotLK 3.3.5a (Interface 30300).

## Installation
1. Download the latest release from the [GitHub repository](https://github.com/yourusername/HideMuteErrors).
2. Extract the `HideMuteErrors` folder to your WoW addons directory:
   - Windows: `World of Warcraft\_retail_\Interface\AddOns\`
   - Mac: `World of Warcraft/_retail_/Interface/AddOns/`
3. Ensure the folder is named `HideMuteErrors` (no version numbers or extra text).
4. Launch World of Warcraft and enable the addon in the AddOns menu at the character selection screen.

## Usage
- The addon automatically hides UI error text and mutes error sounds upon logging in.
- A confirmation message appears in the chat frame: `HideErrors loaded: UI error text and sounds hidden.`
- Use the `/hideerrors` command to toggle functionality:
  - `/hideerrors on`: Shows UI error text and enables error sounds.
  - `/hideerrors off`: Hides UI error text and mutes error sounds (default behavior).

## Commands
- `/hideerrors on` - Enables UI error text and sounds.
- `/hideerrors off` - Hides UI error text and mutes sounds.
- `/hideerrors` - Same as `/hideerrors off`.

## Compatibility
- Designed for **World of Warcraft: Wrath of the Lich King 3.3.5a** (Interface 30300).
- May not work correctly with other WoW versions (e.g., Classic Era, Retail, or other expansions).
- Tested to work alongside other addons without conflicts, but let me know if you encounter issues!

## Notes
- The addon uses a hook to ensure the UI error frame remains hidden even if other addons try to show it.
- If you encounter any bugs or have feature requests, please open an issue on the [GitHub repository](https://github.com/yourusername/HideMuteErrors).

## Author
- **Pstar** (original author of HideErrors)
- Contributions and updates welcome!

## License
This addon is released under the [MIT License](LICENSE). Feel free to modify and distribute as needed.
