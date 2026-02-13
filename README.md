Prerequisites
=============
You have to installed Librelane, if not check out this link and follow its instructions to install
[https://github.com/librelane/librelane/tree/e497957a219525a574eb60d369879c5601443991]

Clone source code
=============
Clone code to your devices by using the bellow command
```
git clone -b pnr https://github.com/pvc2k5/unic-cass-2026_DTCG.git
git submodule update --init --recursive
```

RUN Librelane
=============

first go to the folder you have just cloned
```
 cd unic-cass-2026_DTCG
```
PLL
```
  make PLL
```
Run PNR for ring oscillator invidually:
```
  make ring
```
Run PNR for controller invidually:
```
  make controller
```
View the result in openroad after PNR:
```
  make <module_name> VIEW_RESULTS=1
```
