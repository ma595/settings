 
rm -r  axi-sund--solid_models-study

lscamr-create-study ./axi-sund.amr solid_models.study 

cd axi-sund--solid_models-study
mkdir solid
mkdir solidentropybased
mkdir solidentropybasedstretch

mv $(find . -iname "*solidentropybasedstretch.amr") ./solidentropybasedstretch/SEBS.amr
mv $(find . -iname "*solidentropybased.amr") ./solidentropybased/SEB.amr
mv $(find . -iname "*solid.amr") ./solid/S.amr

cd ./solidentropybasedstretch
sed -i 's/00[0-9].*/solidentropybasedstretch\/}/' SEBS.amr
lscamr-create-study ./SEBS.amr ./../../conv.study
cd -
cd ./solidentropybased
sed -i 's/00[0-9].*/solidentropybased\/}/' SEB.amr
lscamr-create-study ./SEB.amr ./../../conv.study
cd - 
cd ./solid
sed -i 's/00[0-9].*/solid\/}/' S.amr
lscamr-create-study ./S.amr ./../../conv.study

