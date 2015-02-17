# Engineering a Robust Frequency-Modulated Biosensor

A project to identify, simulate, and optimize for the biological conditions
which allow for robust [genetic oscillators](http://en.wikipedia.org/wiki/Oscillating_gene)
in cells, and then use this information to simulate a frequency-modulated biosensor. Built
entirely in MATLAB.

The abstract is produced below, while the full report can be viewed [here.](https://drive.google.com/file/d/0B2QQ52vkvx2XY3RHbFBHdTdJREk/edit)

## Abstract
A biosensor uses a combination of a physiochemical detector and a biosensor to measure the concentration of some analyte. Often, the purpose is simply to provide a readout of the relevant measurement. Many of the methods alter amplitude; that is, they measure a concentration and change it atemporally. However, few attempts have attempted to use frequency-related changes in a biosensor. We modeled the repressilator (Elowitz & Leibler, 2000), the Smolen oscillator (Hasty, Dolnik, Rottschafer, & Collins, 2002), and the metabolator (Fung, et al., 2005), then characterized which parameters are mutable and which could be coupled to a protein of interest. We then altered the equations to account for and experiment with the addition of a synthesis inhibitor or protease. Contour plots were able to show regions of change in frequency in 2D parameter space. Selected parameters with monotonic behavior were further analyzed. Based on the satisfying presence of parameters of interest and monotonic frequency variation, both the Smolen oscillator and the metabolator have distinct advantages: the Smolen oscillator has a wide frequency range, while the metabolator exhibits a widely variable frequency response.
