# RE2 Elevator
Teleport to other floors of Building 

# Sample
> Menu
![MENU](https://cdn.discordapp.com/attachments/910613937555406868/981584394244456520/elev_sample.jpg)



## Dependencies
- [QB Core](https://github.com/qbcore-framework/qb-core)
- [Qb-target](https://github.com/qbcore-framework/qb-target)
- [Qb-menu](https://github.com/qbcore-framework/qb-menu)


# Config

Add Any location like Sample to the config file

```
Config.locations = {
    ["Pilbox"] = {
        [1] = {
            ["name"] = "Philbox RoofTop",
            ["teleport"] = vector4(338.53, -583.9, 74.16, 252.7),
            ["button"] = vector4(338.53, -583.9, 74.16, 252.7)
        },
        [2] = {
            ["name"] = "Philbox First Floor",
            ["teleport"] = vector4(332.39, -595.77, 43.28, 70.94),
            ["button"] = vector4(331.74, -596.9, 43.28, 245.58)
        },
        [3] = {
            ["name"] = "Philbox Parking",
            ["teleport"] = vector4(344.28, -586.2, 28.8, 244.59),
            ["button"] = vector4(345.05, -584.85, 28.8, 73.66)
        },
    },
}
```


## How to Install
```
ensure re2-elevator
change config.lua to your Own Prefer
```

### Feel free for pull request and contributes