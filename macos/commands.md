## Floating Sidebar

```bash
defaults write -g NSSplitViewItemSidebarDefaultsToFloatingAppearance -bool false
```

## Reset Floating Sidebar

```bash
defaults delete -g NSSplitViewItemSidebarDefaultsToFloatingAppearance
```

## Windows Corner Radius

```bash
defaults write -g NSConvolutionOverride1 -float 10
```

## Reset windows corner radis

```bash
defaults delete -g NSConvolutionOverride1
defaults delete -g NSSplitViewItemGlassMinimumCornerRadius
```
