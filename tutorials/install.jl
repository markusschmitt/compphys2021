using Pkg

get_global_env() = string("v", VERSION.major, ".", VERSION.minor)
get_global_env_folder() = joinpath(DEPOT_PATH[1], "environments", get_global_env())
get_active_env() = Base.active_project() |> dirname |> basename

# Check version
if get_global_env() != "v1.6"
    @info "Warning: This script is intended to be used with Julia v1.6. You are using " * get_global_env() * "."
end

# activate global environment (if not already active)
function activate_global_env()
    if get_active_env() != get_global_env()
        Pkg.REPLMode.pkgstr("activate --shared $(get_global_env())")
    end 
    nothing
end

function rm_global_env()
    if isdir(get_global_env_folder())
        cd(get_global_env_folder()) do
            isfile("Project.toml") && rm("Project.toml")
            isfile("Manifest.toml") && rm("Manifest.toml")
        end
    end
    nothing
end

# Installs all correct versions of our package dependencies.
function install()
    activate_global_env()

    # add all pkgs with specific versions (not pinned)
    @info "Installiere alle Pakete..."
    Pkg.add(name="BenchmarkTools", version="0.7.0")
    Pkg.add(name="CSV", version="0.8.4")
    Pkg.add(name="CSVFiles", version="1.0.0")
    Pkg.add(name="ColorTypes", version="0.8.1")
    Pkg.add(name="Cubature", version="1.5.1")
    Pkg.add(name="DataFrames", version="0.22.7")
    Pkg.add(name="DifferentialEquations", version="6.16.0")
    Pkg.add(name="Distributions", version="0.24.15")
    Pkg.add(name="ExcelFiles", version="1.0.0")
    Pkg.add(name="FFTW", version="1.3.2")
    Pkg.add(name="Flux", version="0.8.3")
    Pkg.add(name="Formatting", version="0.4.2")
    Pkg.add(name="HDF5", version="0.15.4")
    Pkg.add(name="LaTeXStrings", version="1.2.1")
    Pkg.add(name="LsqFit", version="0.12.0")
    Pkg.add(name="Measurements", version="2.5.0")
    Pkg.add(name="Polynomials", version="2.0.5")
    Pkg.add(name="ProgressMeter", version="1.5.0")
    Pkg.add(name="PyCall", version="1.92.2")
    Pkg.add(name="PyPlot", version="2.9.0")
    Pkg.add(name="SymPy")
    Pkg.add(name="QuantumOptics", version="0.8.5")
    Pkg.add(name="Traceur", version="0.3.1")
    Pkg.add(name="Zygote", version="0.6.8")

    # precompile
    @info "Bereite alle Pakete vor...."
    pkg"precompile"
end


# Installs all correct versions of our package dependencies
# by overwriting(!) the existing global environment.
function install_overwrite()
    rm_global_env()
    activate_global_env()

    # install IJulia
    @info "Installiere IJulia"
    Pkg.add(name="IJulia")

    # add all pkgs with specific versions (not pinned)
    @info "Installiere alle Pakete..."
    Pkg.add(name="BenchmarkTools", version="0.7.0")
    Pkg.add(name="CSV", version="0.8.4")
    Pkg.add(name="CSVFiles", version="1.0.0")
    Pkg.add(name="ColorTypes", version="0.8.1")
    Pkg.add(name="Cubature", version="1.5.1")
    Pkg.add(name="DataFrames", version="0.22.7")
    Pkg.add(name="DifferentialEquations", version="6.16.0")
    Pkg.add(name="Distributions", version="0.24.15")
    Pkg.add(name="ExcelFiles", version="1.0.0")
    Pkg.add(name="FFTW", version="1.3.2")
    Pkg.add(name="Flux", version="0.8.3")
    Pkg.add(name="Formatting", version="0.4.2")
    Pkg.add(name="HDF5", version="0.15.4")
    Pkg.add(name="LaTeXStrings", version="1.2.1")
    Pkg.add(name="LsqFit", version="0.12.0")
    Pkg.add(name="Measurements", version="2.5.0")
    Pkg.add(name="Polynomials", version="2.0.5")
    Pkg.add(name="ProgressMeter", version="1.5.0")
    Pkg.add(name="PyCall", version="1.92.2")
    Pkg.add(name="PyPlot", version="2.9.0")
    Pkg.add(name="QuantumOptics", version="0.8.5")
    Pkg.add(name="Traceur", version="0.3.1")
    Pkg.add(name="Zygote", version="0.6.8")

    # precompile
    @info "Bereite alle Pakete vor...."
    pkg"precompile"
end

nothing
