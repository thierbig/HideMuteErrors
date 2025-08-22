# HideMuteErrors
A simple World of Warcraft addon for 3.3.5 client (WotLK) that hides the red UI error text (e.g., "Not enough mana" or "Spell not ready yet") and mutes associated error sounds to reduce distractions during gameplay. The addon includes a toggle command to enable or disable these features.

## Features
- Hides the UI error frame to keep your screen clean.
- Mutes error-related sounds for a quieter experience.
- Provides a toggle command (`/hideerrors on|off`) to show or hide error text and sounds.
- Lightweight and compatible with WotLK 3.3.5a

## Installation
1. Download the latest release from the [releases download page](https://github.com/thierbig/HideMuteErrors/releases).
2. Extract the `HideMuteErrors` folder to your WoW addons directory:
   `Interface\AddOns\`
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

## Author
- **Pstar** (original author of HideErrors)
- Contributions and updates welcome!

## License
This addon is released under the [MIT License](LICENSE). Feel free to modify and distribute as needed.
