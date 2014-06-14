# Spike community overlay

This overlay will contain community ebuilds that would be merged in the main overlay.
**We need a set of rules to govern our behavior.**
In this document i'll try to explain how the release process is made so everyone can understand why pulls requests are better then directly pushing inside the repo (unless you know what are you doing, but that's addressed for those who have access).

## Automatic Builds

The automatic building it's run almost everyday: the process it's tied to the commits made on the repositories, so every change it's tracked, tested and then sent to the Spike Entropy repository

### Build process

We have two build servers, x86 and x86_64, they merges everytime the changes inside the specified overlays, test the ebuild and notify the admins about the status. When ebuild passes, it would be automatically pushed into the Entropy repository.

### Automatic upgrades

The build servers scans the packages in the Entropy repository to see if there are upgrades for the atoms that are present in the overlay automatically: they tests the new version bumps and notify if necessary

**This means that if you push directly ebuilds that doesn't pass tests (that doesn't install properly) or doesn't have a Manifest file won't be pushed into the Entropy repository.**

## IF you have repository access

if you push just for testing purposes, you shouldn't push here, but if you REALLY want to do that, because you feel the ebuild it's correct, and you cannot compile on your machine (leveraging the build server power) open a new branch, like user/test-atom

## IF you (don't) have repository access

It's prefeered in both cases that you open a pull request unless you are sure that the ebuild it's working and satisfy QA.

## "spike" category

The spike category will contain meta-ebuilds that lists dependencies required for the distro. For example, *spike/spike* contains all the pentesting tools that are required inside the distribution and will request also the needed atoms for the release process (spike/spike-menu, spike/spike-version, ...).
When you feel a tool should be included in the distribution, open an issue here, so would be processed/tested properly before going upstream.

## Additions

Please feel free to add to this doc rules and policies as you see fit. Discussion can take place on irc.

## IRC

Server: *chat.freenode.net*

Channel: *#spike-pentesting*
 <br>
 <br> Sabayon-zorro-overlay , many things are test quality thier , you can playwith , thier **Ideas**, as it was going to  <br>mainly a sabayon base with pure-pentoo and fixes. allthough not automated by the SPIKE build service, you can shove  <br>us shinny ebuilds for a look thier, esp if quality is more ALPA/Beta.... however with spike thier are 3 of us, vs one  <br>werry tinker doing it all as a lone Graduate Degree  Reserch project. <b>~~{ Necrose99 }~~</b> many spin flavors vers only one. use the OLD zorro repo for stuff we may get too. 
