# Single Arch Doors (`single_arch_doors`)

A standalone automated door mod for **Minetest Game / Luanti**, created by **TumeniNodes**. Part of the `build_pack_01` collection.

This mod features custom-meshed castle and dungeon doors (more to be added later) shaped specifically to nest seamlessly beneath rounded masonry arches (arches mod) without clipping errors.

## Features

* **Animated State Swapping:** Uses an algorithmic time-delay mechanism to step nodes through a custom three-stage, light animation path (`closed` ➔ `half-open` ➔ `fully-open`).
* **Backface Culling Optimization:** Tailored layout configuration explicitly forces standard face orientation, eliminating interior rendering glitches.
* **Layout Varieties:** Offers both flush-offset standard styles and deep-recessed Centered models.

## Installation

Ensure this folder is placed inside your world's `mods/` directory or parent modpack folder and named exactly `single_arch_doors`.

## License

* **Code and Media:** CC-BY-SA 4.0 (See LICENSE)
