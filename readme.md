Automatically generate `.ycm_extra_conf.py` for your pebble project!

### Dependencies

- Vim
- arm-none-eabi-gcc
- [Pebble SDK](https://developer.pebble.com/sdk/)
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
- [YCM-Generator](https://github.com/rdnetto/YCM-Generator)

### Usage

- Download the script and put it under your pebble project
```
cd your-pebble-project
wget https://github.com/petronny/YCM-Generator-pebble/raw/master/gen_ycm_extra_conf.sh
```
- Set up the path of `arm-none-eabi-gcc` in `gen_ycm_extra_conf.sh`
```
export CC=/path/to/arm-none-eabi-gcc
```
- Run it!
```
sh gen_ycm_extra_conf.sh
```
- And enjoy!
```
vim src/c/main.c
```
