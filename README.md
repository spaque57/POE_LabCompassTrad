# Path Of Exile LabCompass translator
Script created by spaque for Path of Exile french fans to tranlsate JSON lab files from [POE LAB](www.poelab.com) and use LabCompass in the french version of POE.
This script will work for any langage.



## ALPHA VERSION
**THIS VERSION should not work with LabCompass because area names are not good.**

## How to use the script
###### Dictionary file
You need an dictionary file with translation of area names, like (tab separated): basilica'\t'basilique
You can see an example inf the file: area_fr.txt

###### Lab JSON file
You need a lab file in JSON format from poelab.com
You can see an example inf the file: merciless-2019-01-08.json

###### Running the script
Run script:
```shell
./LabCompass_trad.pl dictionnary.txt merciless-2019-01-08.json output_name
```


## Next steps
Script should translate word by word the name of the area, but it's not right.
- [x] first draw of the script
- [ ] french words for the area
- [ ] right area syntax



