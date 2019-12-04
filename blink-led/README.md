The `blink_led` program is a simple thumb2-based assembly listing, whose
purpose is...to blink a led. **Forever**.

Specifically, the target led is the green one, hard-wired to the pin `PH02`.
On the board, it can be located right next the `CHG_LED` (charge led), near the
`GPIO-3` bank.

The led has an ON period of $ delay / 1 GHz = 1 / 20 $ seconds. The OFF period is the same. `delay` is hardcoded to `50.000.000`.
