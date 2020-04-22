# MAD_IV_list

Sorting is done by <br>
1. gamepress ranking
2. generation desc

## Preparation

Copy the file `config.example` to `config` and open it in an editor and replace the proper MADmin URL, IV list ID, username, and password.

To get the actual IV list ID, go to your MADmins IV settings page, click on the list's edit button and check your browser's address bar for the numeric value at the end of the URL.

IMPORTANT: Do not add any spaces before or after the `=` characters in the config file.

## Usage

Running `./update` will just upload the latest IV list to your MADmin.

If you want to upload a specific older version of the IV list, just pass the name as parameter such as `./update ivlist_2020-03-26`.

## Support for multiple MAD instances

If you have multple instances, just create multiple config files and pass the name of the config file like this: `./update -c config-instance1 ivlist_2020-03-26`.

## History

11-02-2020 Added audino and alomomola <br>
26-03-2020 Added Solosis, Duosion, Reuniclus, Gothita, Duosion and Reuniclus <br>
01-04-2020 Added Stunfisk <br>
21-04-2020 Added Woobat <br>
22-04-2020 Added Stunfisk <br>
