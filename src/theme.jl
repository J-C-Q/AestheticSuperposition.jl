struct AestheticSuperpositionTheme
    name::Symbol
    size_inches::Tuple{Int,Int}
    type::String
    pt_per_unit::Float64
    theme::Attributes


    function AestheticSuperpositionTheme(;
        name::Symbol=:AestheticSuperposition,
        size_inches::Tuple{Int,Int}=(5, 3),
        type::String="svg",
        pt_per_unit::Float64=1.3
    )

        # set the size of the figure
        size_pt = 72 .* size_inches

        theme = Theme(
            figure_padding=5,
            size=size_pt,
            fontsize=12,
            ##fonts=(; LaTeX=LaTeX_font),
            Lines=(
                linewidth=2.0,
            ),
            Scatter=(
                markersize=3.0,
                strokewidth=2.0,
                marker=:circle
            ),
            ScatterLines=(
                linewidth=2.0,
                markersize=5.0,
                strokewidth=0.7,
                marker=:circle,
            ),
            Errorbars=(
                linewidth=0.7,
                whiskerwidth=6.0
            ),
            Axis=(
                titlefont=:regular,
            ),
            Axis3=(
                titlefont=:regular,
            ),
            Legend=(
                labelfont=:regular,
                padding=(8.0f0, 8.0f0, 5.0f0, 5.0f0), # The additional space between the legend content and the border.
                patchlabelgap=5, # The gap between the patch and the label of each legend entry.
                patchsize=(11, 6), # The size of the rectangles containing the legend markers.
                rowgap=2, # The gap between the entry rows.
                titlefont=:regular,
                titlegap=3,
                margin=(7.0f0, 7.0f0, 7.0f0, 7.0f0),
            ),
            Colorbar=(
                tickalign=1,
            ),
        )

        theme = merge(theme, theme_latexfonts())

        # create the theme
        return new(name, size_inches, type, pt_per_unit, theme)
    end
end


function update_theme!(custom_theme::AestheticSuperpositionTheme)
    # change appearance in a jupyter notebook
    CairoMakie.activate!(type=custom_theme.type, pt_per_unit=custom_theme.pt_per_unit)

    # update theme
    update_theme!(custom_theme.theme)
end


function set_theme!(custom_theme::AestheticSuperpositionTheme)
    # change appearance in a jupyter notebook
    CairoMakie.activate!(type=custom_theme.type, pt_per_unit=custom_theme.pt_per_unit)

    # set theme
    set_theme!(custom_theme.theme)
end
