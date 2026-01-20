<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<CityModel xmlns:con="http://www.opengis.net/citygml/construction/3.0" xmlns:tran="http://www.opengis.net/citygml/transportation/3.0" xmlns:wtr="http://www.opengis.net/citygml/waterbody/3.0" xmlns:veg="http://www.opengis.net/citygml/vegetation/3.0" xmlns="http://www.opengis.net/citygml/3.0" xmlns:dem="http://www.opengis.net/citygml/relief/3.0" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:bldg="http://www.opengis.net/citygml/building/3.0" xmlns:ct="urn:oasis:names:tc:ciq:ct:3" xmlns:grp="http://www.opengis.net/citygml/cityobjectgroup/3.0" xmlns:dyn="http://www.opengis.net/citygml/dynamizer/3.0" xmlns:pcl="http://www.opengis.net/citygml/pointcloud/3.0" xmlns:tun="http://www.opengis.net/citygml/tunnel/3.0" xmlns:frn="http://www.opengis.net/citygml/cityfurniture/3.0" xmlns:gen="http://www.opengis.net/citygml/generics/3.0" xmlns:xAL="urn:oasis:names:tc:ciq:xal:3" xmlns:app="http://www.opengis.net/citygml/appearance/3.0" xmlns:luse="http://www.opengis.net/citygml/landuse/3.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:brid="http://www.opengis.net/citygml/bridge/3.0" xmlns:vers="http://www.opengis.net/citygml/versioning/3.0" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.opengis.net/citygml/construction/3.0 http://schemas.opengis.net/citygml/construction/3.0/construction.xsd http://www.opengis.net/citygml/transportation/3.0 http://schemas.opengis.net/citygml/transportation/3.0/transportation.xsd http://www.opengis.net/citygml/waterbody/3.0 http://schemas.opengis.net/citygml/waterbody/3.0/waterBody.xsd http://www.opengis.net/citygml/vegetation/3.0 http://schemas.opengis.net/citygml/vegetation/3.0/vegetation.xsd http://www.opengis.net/citygml/relief/3.0 http://schemas.opengis.net/citygml/relief/3.0/relief.xsd http://www.opengis.net/citygml/building/3.0 http://schemas.opengis.net/citygml/building/3.0/building.xsd http://www.opengis.net/citygml/cityobjectgroup/3.0 http://schemas.opengis.net/citygml/cityobjectgroup/3.0/cityObjectGroup.xsd http://www.opengis.net/citygml/dynamizer/3.0 http://schemas.opengis.net/citygml/dynamizer/3.0/dynamizer.xsd http://www.opengis.net/citygml/pointcloud/3.0 http://schemas.opengis.net/citygml/pointcloud/3.0/pointCloud.xsd http://www.opengis.net/citygml/tunnel/3.0 http://schemas.opengis.net/citygml/tunnel/3.0/tunnel.xsd http://www.opengis.net/citygml/cityfurniture/3.0 http://schemas.opengis.net/citygml/cityfurniture/3.0/cityFurniture.xsd http://www.opengis.net/citygml/generics/3.0 http://schemas.opengis.net/citygml/generics/3.0/generics.xsd http://www.opengis.net/citygml/appearance/3.0 http://schemas.opengis.net/citygml/appearance/3.0/appearance.xsd http://www.opengis.net/citygml/landuse/3.0 http://schemas.opengis.net/citygml/landuse/3.0/landUse.xsd http://www.opengis.net/citygml/bridge/3.0 http://schemas.opengis.net/citygml/bridge/3.0/bridge.xsd http://www.opengis.net/citygml/versioning/3.0 http://schemas.opengis.net/citygml/versioning/3.0/versioning.xsd">
  <cityObjectMember>
    <bldg:Building gml:id="UUID_d281adfc-4901-0f52-540b-4cc1a9325f82">
      <gml:description>FZK-Haus (Forschungszentrum Karlsruhe, now KIT), created by Karl-Heinz
                Haefele </gml:description>
      <gml:name>AC14-FZK-Haus</gml:name>
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::25832" srsDimension="3">
          <gml:lowerCorner>457842.0 5439083.0 111.8</gml:lowerCorner>
          <gml:upperCorner>457854.0 5439093.0 118.317691453624</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2017-01-23T00:00:00Z</creationDate>
      <relativeToTerrain>entirelyAboveTerrain</relativeToTerrain>
      <genericAttribute>
        <gen:MeasureAttribute>
          <gen:name>GrossPlannedArea</gen:name>
          <gen:value uom="m2">120.0</gen:value>
        </gen:MeasureAttribute>
      </genericAttribute>
      <genericAttribute>
        <gen:StringAttribute>
          <gen:name>ConstructionMethod</gen:name>
          <gen:value>New Building</gen:value>
        </gen:StringAttribute>
      </genericAttribute>
      <genericAttribute>
        <gen:StringAttribute>
          <gen:name>IsLandmarked</gen:name>
          <gen:value>NO</gen:value>
        </gen:StringAttribute>
      </genericAttribute>
      <boundary>
        <con:WallSurface gml:id="GML_5856d7ad-5e34-498a-817b-9544bfbb1475">
          <gml:name>Outer Wall 1 (West)</gml:name>
          <lod2MultiSurface>
            <gml:MultiSurface gml:id="ID_2a53150f-2a59-46dc-ab99-c70556ce9a9d">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID7350_878_759628_120742">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.0 118.317691453624 457842.0 5439093.0 115.430940107676 457842.0 5439093.0 111.8 457842.0 5439083.0 111.8 457842.0 5439083.0 115.430940107676 457842.0 5439088.0 118.317691453624</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod2MultiSurface>
        </con:WallSurface>
      </boundary>
      <boundary>
        <con:WallSurface gml:id="GML_d38cf762-c29d-4491-88c9-bdc89e141978">
          <gml:name>Outer Wall 2 (South)</gml:name>
          <lod2MultiSurface>
            <gml:MultiSurface gml:id="ID_fc91cc04-b9bc-43cf-882d-b7880d94181f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID7351_1722_416019_316876">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439083.0 115.430940107676 457842.0 5439083.0 115.430940107676 457842.0 5439083.0 111.8 457854.0 5439083.0 111.8 457854.0 5439083.0 115.430940107676</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod2MultiSurface>
        </con:WallSurface>
      </boundary>
      <boundary>
        <con:WallSurface gml:id="GML_8e5db638-e46a-4739-a98a-2fc2d39c9069">
          <gml:name>Outer Wall 3 (East)</gml:name>
          <lod2MultiSurface>
            <gml:MultiSurface gml:id="ID_444729b6-c7de-468b-825b-596b7a8718c5">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID7352_230_209861_355851">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.0 118.317691453624 457854.0 5439083.0 115.430940107676 457854.0 5439083.0 111.8 457854.0 5439093.0 111.8 457854.0 5439093.0 115.430940107676 457854.0 5439088.0 118.317691453624</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod2MultiSurface>
        </con:WallSurface>
      </boundary>
      <boundary>
        <con:RoofSurface gml:id="GML_875d470b-32b4-4985-a4c8-0f02caa342a2">
          <gml:name>Roof 1 (North)</gml:name>
          <lod2MultiSurface>
            <gml:MultiSurface gml:id="ID_ce8935ad-94a4-425c-be76-9e3d454d0a45">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID7353_166_774155_320806">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.0 118.317691453624 457854.0 5439088.0 118.317691453624 457854.0 5439093.0 115.430940107676 457842.0 5439093.0 115.430940107676 457842.0 5439088.0 118.317691453624</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod2MultiSurface>
        </con:RoofSurface>
      </boundary>
      <boundary>
        <con:WallSurface gml:id="GML_0f30f604-e70d-4dfe-ba35-853bc69609cc">
          <gml:name>Outer Wall 4 (North)</gml:name>
          <lod2MultiSurface>
            <gml:MultiSurface gml:id="ID_32e21d29-0fa9-45c2-a5a6-191ed20860f2">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID7354_1362_450904_410226">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439093.0 115.430940107676 457854.0 5439093.0 115.430940107676 457854.0 5439093.0 111.8 457842.0 5439093.0 111.8 457842.0 5439093.0 115.430940107676</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod2MultiSurface>
        </con:WallSurface>
      </boundary>
      <boundary>
        <con:RoofSurface gml:id="GML_eeb6796a-e261-4d3b-a6f2-475940cca80a">
          <gml:name>Roof 2 (South)</gml:name>
          <lod2MultiSurface>
            <gml:MultiSurface gml:id="ID_427786ec-cce7-4d66-af5b-46bab561e404">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID7355_537_416207_260034">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439083.0 115.430940107676 457854.0 5439088.0 118.317691453624 457842.0 5439088.0 118.317691453624 457842.0 5439083.0 115.430940107676 457854.0 5439083.0 115.430940107676</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod2MultiSurface>
        </con:RoofSurface>
      </boundary>
      <boundary>
        <con:GroundSurface gml:id="GML_257a8dde-8194-4ca3-b581-abd591dcd6a3">
          <gml:description>Bodenplatte</gml:description>
          <gml:name>Base Surface</gml:name>
          <lod2MultiSurface>
            <gml:MultiSurface gml:id="ID_9f2f3ca8-eb1a-4410-858f-bae95eff17b9">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID7356_612_880782_415367">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439083.0 111.8 457842.0 5439083.0 111.8 457842.0 5439093.0 111.8 457854.0 5439093.0 111.8 457854.0 5439083.0 111.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod2MultiSurface>
        </con:GroundSurface>
      </boundary>
      <lod2Solid>
        <gml:Solid gml:id="ID_50ad47be-7588-4ced-84c2-938167650ae8">
          <gml:exterior>
            <gml:Shell gml:id="ID_789cd9fe-bb2f-4eda-8738-19f4711511c8">
              <gml:surfaceMember xlink:href="#PolyID7350_878_759628_120742"/>
              <gml:surfaceMember xlink:href="#PolyID7351_1722_416019_316876"/>
              <gml:surfaceMember xlink:href="#PolyID7352_230_209861_355851"/>
              <gml:surfaceMember xlink:href="#PolyID7353_166_774155_320806"/>
              <gml:surfaceMember xlink:href="#PolyID7354_1362_450904_410226"/>
              <gml:surfaceMember xlink:href="#PolyID7355_537_416207_260034"/>
              <gml:surfaceMember xlink:href="#PolyID7356_612_880782_415367"/>
            </gml:Shell>
          </gml:exterior>
        </gml:Solid>
      </lod2Solid>
      <con:dateOfConstruction>2020-01-01</con:dateOfConstruction>
      <con:height>
        <con:Height>
          <con:highReference>highestRoofEdge</con:highReference>
          <con:lowReference>lowestGroundPoint</con:lowReference>
          <con:status>measured</con:status>
          <con:value uom="m">6.52</con:value>
        </con:Height>
      </con:height>
      <bldg:class codeSpace="http://www.sig3d.org/codelists/citygml/2.0/building/2.0/_AbstractBuilding_class.xml">1000</bldg:class>
      <bldg:function codeSpace="http://www.sig3d.org/codelists/citygml/2.0/building/2.0/_AbstractBuilding_function.xml">1000</bldg:function>
      <bldg:usage codeSpace="http://www.sig3d.org/codelists/citygml/2.0/building/2.0/_AbstractBuilding_usage.xml">1000</bldg:usage>
      <bldg:roofType codeSpace="http://www.sig3d.org/codelists/citygml/2.0/building/2.0/_AbstractBuilding_roofType.xml">1030</bldg:roofType>
      <bldg:storeysAboveGround>2</bldg:storeysAboveGround>
      <bldg:storeysBelowGround>0</bldg:storeysBelowGround>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:Address>
              <xAL:Locality xAL:Type="Town">
                <xAL:NameElement>Eggenstein-Leopoldshafen</xAL:NameElement>
              </xAL:Locality>
              <xAL:Thoroughfare xAL:Type="Street">
                <xAL:NameElement>Spöcker Straße</xAL:NameElement>
                <xAL:Number>4711</xAL:Number>
              </xAL:Thoroughfare>
              <xAL:PostCode>
                <xAL:Identifier>76344</xAL:Identifier>
              </xAL:PostCode>
            </xAL:Address>
          </xalAddress>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
</CityModel>