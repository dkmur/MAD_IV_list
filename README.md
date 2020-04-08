# MAD_IV_list

Sorting is done
1 gamepress ranking
2 generation desc

## Preparation

Copy the file `config.example` to `config` and open it in an editor. Replace the proper MADmin URL, username and password. Do not put any space charaters after the `=` sign.

## Usage

Running `./update` will just upload the latest IV list to your MADmin.

If you want to upload a specific older version of the IV list, just pass the name as parameter such as `./update ivlist_2020-03-26`.

## Support for multiple MAD instances

If you have multple instances, just create multiple config files and pass the name of the config file like this: `./update -c config-instance1 ivlist_2020-03-26`.

## History

11-02-2020 Added audino and alomomola  
26-03-2020 Added Solosis, Duosion, Reuniclus, Gothita, Duosion and Reuniclus  
01-04-2020 Added Stunfisk  
