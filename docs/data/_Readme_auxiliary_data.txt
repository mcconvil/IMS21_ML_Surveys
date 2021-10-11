#########################################################
## Spatial data layers used for FIESTA estimation
## 2021 Sept 14
#########################################################

Post-stratification
tnt		LANDFIRE 2014 90-m tree/non-tree lifeform mask

Generalized Regression (GREG) predictors
tnt		LANDFIRE 2014 90-m tree/non-tree lifeform mask
tcc16		National Land Cover Dataset (NLCD), Analytical Tree Canopy Cover
dem		LANDFIRE 2010 30 meter resolution DEM Esri GRID 
ppt		PRISM mean annual precipitation - 30yr normals (1981-2010)
tmean		PRISM mean annual temperature - 30yr normals (1981-2010)
tmin01		PRISM mean minimum temperature (Jan) - 30yr normals (1981-2010)



## tnt - evt14_tnt_90m.tif 
######################################################################
Description:
LANDFIRE 2014 90-m tree/non-tree lifeform mask
A 90-m tree/non-tree lifeform mask, recoded from LANDFIRE 2014 Existing Vegetation Type (EVT) (Rollins 2019). LANDFIRE's Existing Vegetation (EVT) product depicts the current distribution of plant community types with similar ecological characteristics defined by NatureServe (NatureServe 2018), referred to as ecological systems. EVT classes were reclassed to two classes, representing dominant lifeform: 1 - tree lifeform; 2 - non-tree. 

- Format: TIFF
- Pixel type: unsigned integer
- Pixel depth: 4-bit
- NoData value 0
- Uncompressed size: 795 MB
- Resolution: 90-meter
- Compression type: LZW
- CRS: +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0

Original layer:
EVT was downloaded from the LANDFIRE Existing Vegetation Type site (https://www.landfire.gov/evt.php). EVT classes were reclassed to tree/non-tree and resampled to 90 meters using the maximum value for a focal window of 3x3 pixels.

Processing steps:
1. source raster: LANDFIRE 2014 EVT ArcGrid (US_140EVT_20180618.zip)
2. resampled to 90-m by modal value
3. EVT attribute table: LF_140EVT_09152016.csv
4. TnT = 1 if EVT_LF = Tree, otherwise TnT = 2 (evt14_TnT_lut.csv)
5. TnT raster written to: evt14_tnt_90m.tif 
 

References:
Rollins, Matthew G. 2009. LANDFIRE: A Nationally Consistent Vegetation, Wildland Fire, and Fuel Assessment. International Journal of Wildland Fire 18(3). CSIRO:35-49.

NatureServe. 2018. International Ecological Classification Standard: Terrestrial Ecological Classifications. NatureServe Central Databases. Arlington, VA. U.S.A. Data current as of 28 August.


## tcc16 - usfs_2016_CONUS_canopy_analytical_12-14-2018_u8_90m_avg.tif
National Land Cover Dataset (NLCD), Analytical Tree Canopy Cover raster (Yang et al. 2018), resampled to 90m using the average of the original 30-m pixels within each 90-m pixel. Processed with gdalwarp (GDAL 3.0.2).
- Format: TIFF
- Pixel type: unsigned integer
- Pixel depth: 8-bit
- NoData value 255
- Uncompressed size: 15.68 GB
- Resolution: 90-meter
- Compression type: Deflate
- Units: Percent
- CRS: +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0

Original layer:
usfs_2016_CONUS_canopy_analytical_12-14-2018_u8.img
Downloaded from the FSGeodata Clearinghouse Raster Data Gateway on 2019 April 6, format ERDAS imagine
(https://data.fs.usda.gov/geodata/rastergateway/treecanopycover/)

Components of the 2016 TCC Product Suite released in 2019 (FS "Analytical" TCC)
- Two-layer dataset, with modeled TCC values on every pixel, along with a standard error value + metadata
- Closest to objective numerical model outputs
- Data for the years of 2011 and 2016 are available

Reference:
Yang, L., et al. 2018. A new generation of the United States National Land Cover Database: Requirements, research priorities, design, and implementation strategies. ISPRS Journal of Photogrammetry and Remote Sensing 146: 108-123.



## dem - conus_dem 
######################################################################
LANDFIRE 2010 30 meter resolution DEM Esri GRID 
(https://www.landfire.gov/elevation.php)
Elevation represents land height, in meters, above mean sea level. Elevation was derived from the National Elevation Dataset (NED). NED comprises merged 7.5 minute quadrangle topographic data resulting in a high quality, consistent elevation data set that spans the nation. 
Elevation unit measurements are meters above mean sea level. 

- Format: TIFF
- Pixel Type: signed integer
- Pixel Depth: - 16-bit
- NoData Value: -32768
- Uncompressed size: 27.94 GB
- Resolution: 30-meter
- Compression: PACKBITS
- Units: meters
- CRS: +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0

Reference:
US Geological Survey. 2019. LANDFIRE Elevation. USGS EROS, Sioux Falls, South Dakota [Date accessed: 2019, Dec 5].


## ppt - PRISM_ppt_30yr_normal_800mM2_annual_prj.tif
######################################################################
Description:
Precipitation
The PRISM Climate Group gathers climate observations from a wide range of monitoring networks, applies sophisticated quality control measures, and develops spatial climate datasets to reveal short- and long-term climate patterns. The normals are baseline datasets describing average monthly and annual conditions over the most recent three full decades. The current PRISM normals cover the period 1981-2010.
- Format: TIFF
- Pixel type: signed integer
- Pixel depth: 16-bit
- NoData Value: -9999
- Uncompressed size: 65 MB
- Resolution: 800-meter
- Compression type: DEFLATE
- Units: millimeters
- CRS: +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0

Reference:
Daly, C. 2002. Climate division normals derived from topographically-sensitive climate grids. 13th AMS Conf. on Applied Climatology, Portland, OR, May 13-16, 177-180 [Date accessed: 2021, Feb 11].



## tmean - PRISM_tmean_30yr_normal_800mM2_annual_prj.tif
######################################################################
Description:
Mean temperature
The PRISM Climate Group gathers climate observations from a wide range of monitoring networks, applies sophisticated quality control measures, and develops spatial climate datasets to reveal short- and long-term climate patterns. The normals are baseline datasets describing average monthly and annual conditions over the most recent three full decades. The current PRISM normals cover the period 1981-2010.
- Format: TIFF
- Pixel type: signed integer
- Pixel depth: 16-bit
- NoData Value: -9999
- Uncompressed size: 65 MB
- Resolution: 800-meter
- Compression type: DEFLATE
- Units: degrees Celsius X 100
- CRS: +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0

Reference:
Daly, C. 2002. Climate division normals derived from topographically-sensitive climate grids. 13th AMS Conf. on Applied Climatology, Portland, OR, May 13-16, 177-180 [Date accessed: 2021, Feb 11].


## tmin01 - PRISM_tmin_30yr_normal_800mM2_01_prj.tif
######################################################################
Description:
Min temperature - January
The PRISM Climate Group gathers climate observations from a wide range of monitoring networks, applies sophisticated quality control measures, and develops spatial climate datasets to reveal short- and long-term climate patterns. The normals are baseline datasets describing average monthly and annual conditions over the most recent three full decades. The current PRISM normals cover the period 1981-2010.
- Format: TIFF
- Pixel type: signed integer
- Pixel depth: 16-bit
- NoData Value: -9999
- Uncompressed size: 65 MB
- Resolution: 800-meter
- Compression type: DEFLATE
- Units: degrees Celsius X 100
- CRS: +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0

Reference:
Daly, C. 2002. Climate division normals derived from topographically-sensitive climate grids. 13th AMS Conf. on Applied Climatology, Portland, OR, May 13-16, 177-180 [Date accessed: 2021, Feb 11].


