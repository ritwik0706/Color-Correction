# Color-Correction
Implementation of color correction in matlab for both RGB and Grayscale images.
Many times, you click a pic and some of the image part remains underexposed because of flash or bright sunlight. Don't worry, click the pic and correct it using this hack.

# For Grayscale Images
This source code is the implmentation of Local Color Correction using Non-Linear Masking published by Nathan Moroney Hewlett-Packard Laboratories,  Palo Alto, California.

In this method, a local color correction operation is performed that is based on non-linear masking. The operation is very fast and does not require any manual adjustments.

# For RGB Images
Same Method as above is applied channel by channel, i.e., first on R channel, then on G, and then on B channel.
