<div align="center"> 
 <a href="https://github.com/alanRizzo/dot-files/tree/main/alacritty"><img alt="Alacritty" src="https://user-images.githubusercontent.com/36242460/209569533-73974493-3950-4814-ac87-475f7b13e86d.png" height="100"></a>
</div>

## Installation

To install Alacritty, follow the instructions outlined in the Alacritty [installation guide](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#prerequisites)

## Post-Installation

After installing Alacritty, verify the compiled terminfo entry for a particular terminal type using the following command:

```bash
infocmp alacritty
```

If the above command returns an error, refer to the [post-build instruction](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#post-build)


## Schemas
There are a list of color schemas to personalize your terminal.
To change the color schema, go to the end of ***color_schemas.yml*** and overwrite the schema using the desired one.

```bash
colors: *<desired_schema>
```

Make sure to replace **<desired_schema>** with the name of the schema you want to use.


## Selfie
<img width="1440" alt="Captura de pantalla 2023-04-02 a la(s) 16 51 48" src="https://user-images.githubusercontent.com/36242460/229375792-41b89128-a61d-4767-9055-d6976e9b4c3e.png">



