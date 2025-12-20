import exoplasim as exo

toi700d = exo.Model(workdir="toi700d_run",modelname="TOI-700d",
                    ncpus=8,resolution="T21",outputtype=".nc")

toi700d.configure(startemp=3480.0, flux=1167.0,                           # Stellar parameters
                  eccentricity=0.,obliquity=0.,fixedorbit=True,           # Orbital parameters
                  synchronous=True,rotationperiod=37.426,                 # Rotation
                  radius=1.19,gravity=11.9,aquaplanet=True,               # Bulk properties
                  pN2=1.47*(1-360e-6),pCO2=1.47*360e-6,ozone=False,       # Atmosphere
                  timestep=30.0,snapshots=720,physicsfilter="gp|exp|sp")  # Model dynamics

toi700d.exportcfg()

toi700d.run(years=10,crashifbroken=True)
