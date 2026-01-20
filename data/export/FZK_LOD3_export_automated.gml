<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<CityModel xmlns:con="http://www.opengis.net/citygml/construction/3.0" xmlns:tran="http://www.opengis.net/citygml/transportation/3.0" xmlns:wtr="http://www.opengis.net/citygml/waterbody/3.0" xmlns:veg="http://www.opengis.net/citygml/vegetation/3.0" xmlns="http://www.opengis.net/citygml/3.0" xmlns:dem="http://www.opengis.net/citygml/relief/3.0" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:bldg="http://www.opengis.net/citygml/building/3.0" xmlns:ct="urn:oasis:names:tc:ciq:ct:3" xmlns:grp="http://www.opengis.net/citygml/cityobjectgroup/3.0" xmlns:dyn="http://www.opengis.net/citygml/dynamizer/3.0" xmlns:pcl="http://www.opengis.net/citygml/pointcloud/3.0" xmlns:tun="http://www.opengis.net/citygml/tunnel/3.0" xmlns:frn="http://www.opengis.net/citygml/cityfurniture/3.0" xmlns:gen="http://www.opengis.net/citygml/generics/3.0" xmlns:xAL="urn:oasis:names:tc:ciq:xal:3" xmlns:app="http://www.opengis.net/citygml/appearance/3.0" xmlns:luse="http://www.opengis.net/citygml/landuse/3.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:brid="http://www.opengis.net/citygml/bridge/3.0" xmlns:vers="http://www.opengis.net/citygml/versioning/3.0" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.opengis.net/citygml/construction/3.0 http://schemas.opengis.net/citygml/construction/3.0/construction.xsd http://www.opengis.net/citygml/transportation/3.0 http://schemas.opengis.net/citygml/transportation/3.0/transportation.xsd http://www.opengis.net/citygml/waterbody/3.0 http://schemas.opengis.net/citygml/waterbody/3.0/waterBody.xsd http://www.opengis.net/citygml/vegetation/3.0 http://schemas.opengis.net/citygml/vegetation/3.0/vegetation.xsd http://www.opengis.net/citygml/relief/3.0 http://schemas.opengis.net/citygml/relief/3.0/relief.xsd http://www.opengis.net/citygml/building/3.0 http://schemas.opengis.net/citygml/building/3.0/building.xsd http://www.opengis.net/citygml/cityobjectgroup/3.0 http://schemas.opengis.net/citygml/cityobjectgroup/3.0/cityObjectGroup.xsd http://www.opengis.net/citygml/dynamizer/3.0 http://schemas.opengis.net/citygml/dynamizer/3.0/dynamizer.xsd http://www.opengis.net/citygml/pointcloud/3.0 http://schemas.opengis.net/citygml/pointcloud/3.0/pointCloud.xsd http://www.opengis.net/citygml/tunnel/3.0 http://schemas.opengis.net/citygml/tunnel/3.0/tunnel.xsd http://www.opengis.net/citygml/cityfurniture/3.0 http://schemas.opengis.net/citygml/cityfurniture/3.0/cityFurniture.xsd http://www.opengis.net/citygml/generics/3.0 http://schemas.opengis.net/citygml/generics/3.0/generics.xsd http://www.opengis.net/citygml/appearance/3.0 http://schemas.opengis.net/citygml/appearance/3.0/appearance.xsd http://www.opengis.net/citygml/landuse/3.0 http://schemas.opengis.net/citygml/landuse/3.0/landUse.xsd http://www.opengis.net/citygml/bridge/3.0 http://schemas.opengis.net/citygml/bridge/3.0/bridge.xsd http://www.opengis.net/citygml/versioning/3.0 http://schemas.opengis.net/citygml/versioning/3.0/versioning.xsd">
  <cityObjectMember>
    <bldg:Building gml:id="UUID_d281adfc-4901-0f52-540b-4cc1a9325f82">
      <gml:description>FZK-Haus (Forschungszentrum Karlsruhe, now KIT), created by Karl-Heinz
                Haefele </gml:description>
      <gml:name>AC14-FZK-Haus</gml:name>
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::25832" srsDimension="3">
          <gml:lowerCorner>457841.5 5439082.5 111.8</gml:lowerCorner>
          <gml:upperCorner>457854.5 5439093.5 118.317691453624</gml:upperCorner>
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
          <lod3MultiSurface>
            <gml:MultiSurface gml:id="ID_ddc86e4e-a761-42d4-bd1f-5319e2fbb422">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58718_509_420914_99840">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.49240388 115.913175911167 457842.12 5439088.49240388 115.913175911167 457842.12 5439088.49809735 115.956422128626 457842.0 5439088.49809735 115.956422128626 457842.0 5439088.49240388 115.913175911167</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58719_1668_843061_5809">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.49809735 115.956422128626 457842.12 5439088.49809735 115.956422128626 457842.12 5439088.5 116.0 457842.0 5439088.5 116.0 457842.0 5439088.49809735 115.956422128626</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58720_254_451830_156398">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.5 116.0 457842.12 5439088.5 116.0 457842.12 5439088.49809735 116.043577871374 457842.0 5439088.49809735 116.043577871374 457842.0 5439088.5 116.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58721_1706_427521_368985">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.49809735 116.043577871374 457842.12 5439088.49809735 116.043577871374 457842.12 5439088.49240388 116.086824088833 457842.0 5439088.49240388 116.086824088833 457842.0 5439088.49809735 116.043577871374</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58722_224_323902_252423">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.49240388 116.086824088833 457842.12 5439088.49240388 116.086824088833 457842.12 5439088.48296291 116.129409522551 457842.0 5439088.48296291 116.129409522551 457842.0 5439088.49240388 116.086824088833</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58723_439_431781_373725">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.48296291 116.129409522551 457842.12 5439088.48296291 116.129409522551 457842.12 5439088.46984631 116.171010071663 457842.0 5439088.46984631 116.171010071663 457842.0 5439088.48296291 116.129409522551</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58724_1967_868315_208008">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.46984631 116.171010071663 457842.12 5439088.46984631 116.171010071663 457842.12 5439088.45315389 116.21130913087 457842.0 5439088.45315389 116.21130913087 457842.0 5439088.46984631 116.171010071663</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58725_1421_209484_393490">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.45315389 116.21130913087 457842.12 5439088.45315389 116.21130913087 457842.12 5439088.4330127 116.25 457842.0 5439088.4330127 116.25 457842.0 5439088.45315389 116.21130913087</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58726_671_554234_212436">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.4330127 116.25 457842.12 5439088.4330127 116.25 457842.12 5439088.40957602 116.286788218176 457842.0 5439088.40957602 116.286788218176 457842.0 5439088.4330127 116.25</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58727_657_504736_78856">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.40957602 116.286788218176 457842.12 5439088.40957602 116.286788218176 457842.12 5439088.38302222 116.321393804843 457842.0 5439088.38302222 116.321393804843 457842.0 5439088.40957602 116.286788218176</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58728_577_102541_299483">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.38302222 116.321393804843 457842.12 5439088.38302222 116.321393804843 457842.12 5439088.35355339 116.353553390593 457842.0 5439088.35355339 116.353553390593 457842.0 5439088.38302222 116.321393804843</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58729_1200_447052_104531">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.35355339 116.353553390593 457842.12 5439088.35355339 116.353553390593 457842.12 5439088.3213938 116.383022221559 457842.0 5439088.3213938 116.383022221559 457842.0 5439088.35355339 116.353553390593</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58730_1683_860946_68139">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.3213938 116.383022221559 457842.12 5439088.3213938 116.383022221559 457842.12 5439088.28678822 116.409576022145 457842.0 5439088.28678822 116.409576022145 457842.0 5439088.3213938 116.383022221559</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58731_1219_480209_127236">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.28678822 116.409576022145 457842.12 5439088.28678822 116.409576022145 457842.12 5439088.25 116.433012701892 457842.0 5439088.25 116.433012701892 457842.0 5439088.28678822 116.409576022145</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58732_300_736728_134369">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.25 116.433012701892 457842.12 5439088.25 116.433012701892 457842.12 5439088.21130913 116.453153893518 457842.0 5439088.21130913 116.453153893518 457842.0 5439088.25 116.433012701892</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58733_1677_827795_100700">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.21130913 116.453153893518 457842.12 5439088.21130913 116.453153893518 457842.12 5439088.17101007 116.469846310393 457842.0 5439088.17101007 116.469846310393 457842.0 5439088.21130913 116.453153893518</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58734_443_173915_418248">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.17101007 116.469846310393 457842.12 5439088.17101007 116.469846310393 457842.12 5439088.12940952 116.482962913145 457842.0 5439088.12940952 116.482962913145 457842.0 5439088.17101007 116.469846310393</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58735_61_408337_179410">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.12940952 116.482962913145 457842.12 5439088.12940952 116.482962913145 457842.12 5439088.08682409 116.492403876506 457842.0 5439088.08682409 116.492403876506 457842.0 5439088.12940952 116.482962913145</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58736_1099_849209_286672">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.08682409 116.492403876506 457842.12 5439088.08682409 116.492403876506 457842.12 5439088.04357787 116.498097349046 457842.0 5439088.04357787 116.498097349046 457842.0 5439088.08682409 116.492403876506</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58737_1064_836277_325527">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.04357787 116.498097349046 457842.12 5439088.04357787 116.498097349046 457842.12 5439088.0 116.5 457842.0 5439088.0 116.5 457842.0 5439088.04357787 116.498097349046</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58738_1858_410319_138382">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.0 116.5 457842.12 5439088.0 116.5 457842.12 5439087.95642213 116.498097349046 457842.0 5439087.95642213 116.498097349046 457842.0 5439088.0 116.5</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58739_93_139462_125106">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.95642213 116.498097349046 457842.12 5439087.95642213 116.498097349046 457842.12 5439087.91317591 116.492403876506 457842.0 5439087.91317591 116.492403876506 457842.0 5439087.95642213 116.498097349046</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58740_597_260514_271204">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.91317591 116.492403876506 457842.12 5439087.91317591 116.492403876506 457842.12 5439087.87059048 116.482962913145 457842.0 5439087.87059048 116.482962913145 457842.0 5439087.91317591 116.492403876506</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58741_292_29758_205873">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.87059048 116.482962913145 457842.12 5439087.87059048 116.482962913145 457842.12 5439087.82898993 116.469846310393 457842.0 5439087.82898993 116.469846310393 457842.0 5439087.87059048 116.482962913145</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58742_1305_101478_70299">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.82898993 116.469846310393 457842.12 5439087.82898993 116.469846310393 457842.12 5439087.78869087 116.453153893518 457842.0 5439087.78869087 116.453153893518 457842.0 5439087.82898993 116.469846310393</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58743_353_267552_336288">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.78869087 116.453153893518 457842.12 5439087.78869087 116.453153893518 457842.12 5439087.75 116.433012701892 457842.0 5439087.75 116.433012701892 457842.0 5439087.78869087 116.453153893518</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58744_151_805227_372589">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.75 116.433012701892 457842.12 5439087.75 116.433012701892 457842.12 5439087.71321178 116.409576022145 457842.0 5439087.71321178 116.409576022145 457842.0 5439087.75 116.433012701892</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58745_1956_497265_192895">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.71321178 116.409576022145 457842.12 5439087.71321178 116.409576022145 457842.12 5439087.6786062 116.383022221559 457842.0 5439087.6786062 116.383022221559 457842.0 5439087.71321178 116.409576022145</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58746_346_607928_425761">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.6786062 116.383022221559 457842.12 5439087.6786062 116.383022221559 457842.12 5439087.64644661 116.353553390593 457842.0 5439087.64644661 116.353553390593 457842.0 5439087.6786062 116.383022221559</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58747_1503_480064_356412">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.64644661 116.353553390593 457842.12 5439087.64644661 116.353553390593 457842.12 5439087.61697778 116.321393804843 457842.0 5439087.61697778 116.321393804843 457842.0 5439087.64644661 116.353553390593</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58748_1646_113420_81152">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.61697778 116.321393804843 457842.12 5439087.61697778 116.321393804843 457842.12 5439087.59042398 116.286788218176 457842.0 5439087.59042398 116.286788218176 457842.0 5439087.61697778 116.321393804843</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58749_1825_295579_315972">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.59042398 116.286788218176 457842.12 5439087.59042398 116.286788218176 457842.12 5439087.5669873 116.25 457842.0 5439087.5669873 116.25 457842.0 5439087.59042398 116.286788218176</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58750_564_629766_418777">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.5669873 116.25 457842.12 5439087.5669873 116.25 457842.12 5439087.54684611 116.21130913087 457842.0 5439087.54684611 116.21130913087 457842.0 5439087.5669873 116.25</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58751_151_118600_295696">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.54684611 116.21130913087 457842.12 5439087.54684611 116.21130913087 457842.12 5439087.53015369 116.171010071663 457842.0 5439087.53015369 116.171010071663 457842.0 5439087.54684611 116.21130913087</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58752_858_826323_376037">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.53015369 116.171010071663 457842.12 5439087.53015369 116.171010071663 457842.12 5439087.51703709 116.129409522551 457842.0 5439087.51703709 116.129409522551 457842.0 5439087.53015369 116.171010071663</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58753_1323_788001_38056">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.51703709 116.129409522551 457842.12 5439087.51703709 116.129409522551 457842.12 5439087.50759612 116.086824088833 457842.0 5439087.50759612 116.086824088833 457842.0 5439087.51703709 116.129409522551</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58754_847_898397_204895">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.50759612 116.086824088833 457842.12 5439087.50759612 116.086824088833 457842.12 5439087.50190265 116.043577871374 457842.0 5439087.50190265 116.043577871374 457842.0 5439087.50759612 116.086824088833</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58755_855_543018_273807">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.50190265 116.043577871374 457842.12 5439087.50190265 116.043577871374 457842.12 5439087.5 116.0 457842.0 5439087.5 116.0 457842.0 5439087.50190265 116.043577871374</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58756_728_727477_129311">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.5 116.0 457842.12 5439087.5 116.0 457842.12 5439087.50190265 115.956422128626 457842.0 5439087.50190265 115.956422128626 457842.0 5439087.5 116.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58757_1190_133733_205599">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.50190265 115.956422128626 457842.12 5439087.50190265 115.956422128626 457842.12 5439087.50759612 115.913175911167 457842.0 5439087.50759612 115.913175911167 457842.0 5439087.50190265 115.956422128626</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58758_473_866699_76298">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.50759612 115.913175911167 457842.12 5439087.50759612 115.913175911167 457842.12 5439087.51703709 115.870590477449 457842.0 5439087.51703709 115.870590477449 457842.0 5439087.50759612 115.913175911167</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58759_932_219075_423932">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.51703709 115.870590477449 457842.12 5439087.51703709 115.870590477449 457842.12 5439087.53015369 115.828989928337 457842.0 5439087.53015369 115.828989928337 457842.0 5439087.51703709 115.870590477449</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58760_1123_610859_324850">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.53015369 115.828989928337 457842.12 5439087.53015369 115.828989928337 457842.12 5439087.54684611 115.78869086913 457842.0 5439087.54684611 115.78869086913 457842.0 5439087.53015369 115.828989928337</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58761_360_748179_284772">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.54684611 115.78869086913 457842.12 5439087.54684611 115.78869086913 457842.12 5439087.5669873 115.75 457842.0 5439087.5669873 115.75 457842.0 5439087.54684611 115.78869086913</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58762_1767_354637_153477">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.5669873 115.75 457842.12 5439087.5669873 115.75 457842.12 5439087.59042398 115.713211781824 457842.0 5439087.59042398 115.713211781824 457842.0 5439087.5669873 115.75</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58763_197_610103_163787">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.59042398 115.713211781824 457842.12 5439087.59042398 115.713211781824 457842.12 5439087.61697778 115.678606195157 457842.0 5439087.61697778 115.678606195157 457842.0 5439087.59042398 115.713211781824</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58764_11_591251_67040">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.61697778 115.678606195157 457842.12 5439087.61697778 115.678606195157 457842.12 5439087.64644661 115.646446609407 457842.0 5439087.64644661 115.646446609407 457842.0 5439087.61697778 115.678606195157</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58765_1620_317404_230187">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.64644661 115.646446609407 457842.12 5439087.64644661 115.646446609407 457842.12 5439087.6786062 115.616977778441 457842.0 5439087.6786062 115.616977778441 457842.0 5439087.64644661 115.646446609407</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58766_1041_669385_130795">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.6786062 115.616977778441 457842.12 5439087.6786062 115.616977778441 457842.12 5439087.71321178 115.590423977855 457842.0 5439087.71321178 115.590423977855 457842.0 5439087.6786062 115.616977778441</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58767_309_319898_242176">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.71321178 115.590423977855 457842.12 5439087.71321178 115.590423977855 457842.12 5439087.75 115.566987298108 457842.0 5439087.75 115.566987298108 457842.0 5439087.71321178 115.590423977855</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58768_1040_256187_326219">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.75 115.566987298108 457842.12 5439087.75 115.566987298108 457842.12 5439087.78869087 115.546846106482 457842.0 5439087.78869087 115.546846106482 457842.0 5439087.75 115.566987298108</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58769_1881_454925_167376">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.78869087 115.546846106482 457842.12 5439087.78869087 115.546846106482 457842.12 5439087.82898993 115.530153689607 457842.0 5439087.82898993 115.530153689607 457842.0 5439087.78869087 115.546846106482</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58770_1784_618181_39032">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.82898993 115.530153689607 457842.12 5439087.82898993 115.530153689607 457842.12 5439087.87059048 115.517037086855 457842.0 5439087.87059048 115.517037086855 457842.0 5439087.82898993 115.530153689607</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58771_1187_701223_394355">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.87059048 115.517037086855 457842.12 5439087.87059048 115.517037086855 457842.12 5439087.91317591 115.507596123494 457842.0 5439087.91317591 115.507596123494 457842.0 5439087.87059048 115.517037086855</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58772_547_637713_390862">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.91317591 115.507596123494 457842.12 5439087.91317591 115.507596123494 457842.12 5439087.95642213 115.501902650954 457842.0 5439087.95642213 115.501902650954 457842.0 5439087.91317591 115.507596123494</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58773_793_593960_380050">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.95642213 115.501902650954 457842.12 5439087.95642213 115.501902650954 457842.12 5439088.0 115.5 457842.0 5439088.0 115.5 457842.0 5439087.95642213 115.501902650954</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58774_793_865544_188787">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.0 115.5 457842.12 5439088.0 115.5 457842.12 5439088.04357787 115.501902650954 457842.0 5439088.04357787 115.501902650954 457842.0 5439088.0 115.5</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58775_282_175384_345012">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.04357787 115.501902650954 457842.12 5439088.04357787 115.501902650954 457842.12 5439088.08682409 115.507596123494 457842.0 5439088.08682409 115.507596123494 457842.0 5439088.04357787 115.501902650954</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58776_1552_664428_319210">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.08682409 115.507596123494 457842.12 5439088.08682409 115.507596123494 457842.12 5439088.12940952 115.517037086855 457842.0 5439088.12940952 115.517037086855 457842.0 5439088.08682409 115.507596123494</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58777_1359_666261_417799">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.12940952 115.517037086855 457842.12 5439088.12940952 115.517037086855 457842.12 5439088.17101007 115.530153689607 457842.0 5439088.17101007 115.530153689607 457842.0 5439088.12940952 115.517037086855</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58778_1096_548803_126046">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.17101007 115.530153689607 457842.12 5439088.17101007 115.530153689607 457842.12 5439088.21130913 115.546846106482 457842.0 5439088.21130913 115.546846106482 457842.0 5439088.17101007 115.530153689607</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58779_1428_163641_401174">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.21130913 115.546846106482 457842.12 5439088.21130913 115.546846106482 457842.12 5439088.25 115.566987298108 457842.0 5439088.25 115.566987298108 457842.0 5439088.21130913 115.546846106482</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58780_568_797601_421115">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.25 115.566987298108 457842.12 5439088.25 115.566987298108 457842.12 5439088.28678822 115.590423977855 457842.0 5439088.28678822 115.590423977855 457842.0 5439088.25 115.566987298108</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58781_1599_837624_120564">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.28678822 115.590423977855 457842.12 5439088.28678822 115.590423977855 457842.12 5439088.3213938 115.616977778441 457842.0 5439088.3213938 115.616977778441 457842.0 5439088.28678822 115.590423977855</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58782_1554_391576_397213">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.3213938 115.616977778441 457842.12 5439088.3213938 115.616977778441 457842.12 5439088.35355339 115.646446609407 457842.0 5439088.35355339 115.646446609407 457842.0 5439088.3213938 115.616977778441</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58783_1364_412095_196243">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.35355339 115.646446609407 457842.12 5439088.35355339 115.646446609407 457842.12 5439088.38302222 115.678606195157 457842.0 5439088.38302222 115.678606195157 457842.0 5439088.35355339 115.646446609407</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58784_1851_450835_195960">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.38302222 115.678606195157 457842.12 5439088.38302222 115.678606195157 457842.12 5439088.40957602 115.713211781824 457842.0 5439088.40957602 115.713211781824 457842.0 5439088.38302222 115.678606195157</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58785_571_484072_399504">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.40957602 115.713211781824 457842.12 5439088.40957602 115.713211781824 457842.12 5439088.4330127 115.75 457842.0 5439088.4330127 115.75 457842.0 5439088.40957602 115.713211781824</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58786_416_647588_414858">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.4330127 115.75 457842.12 5439088.4330127 115.75 457842.12 5439088.45315389 115.78869086913 457842.0 5439088.45315389 115.78869086913 457842.0 5439088.4330127 115.75</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58787_678_758646_31866">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.45315389 115.78869086913 457842.12 5439088.45315389 115.78869086913 457842.12 5439088.46984631 115.828989928337 457842.0 5439088.46984631 115.828989928337 457842.0 5439088.45315389 115.78869086913</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58788_756_104461_254505">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.46984631 115.828989928337 457842.12 5439088.46984631 115.828989928337 457842.12 5439088.48296291 115.870590477449 457842.0 5439088.48296291 115.870590477449 457842.0 5439088.46984631 115.828989928337</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58789_846_196612_169762">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.48296291 115.870590477449 457842.12 5439088.48296291 115.870590477449 457842.12 5439088.49240388 115.913175911167 457842.0 5439088.49240388 115.913175911167 457842.0 5439088.48296291 115.870590477449</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58790_1248_92472_252525">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.505 114.01 457842.2 5439088.505 114.01 457842.2 5439087.495 114.01 457842.0 5439087.495 114.01 457842.0 5439088.505 114.01</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58791_120_287257_174378">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439084.205 114.0 457842.12 5439084.205 114.0 457842.12 5439084.205 112.8 457842.0 5439084.205 112.8 457842.0 5439084.205 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58792_59_583087_214481">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439086.205 114.0 457842.12 5439086.205 114.0 457842.12 5439084.205 114.0 457842.0 5439084.205 114.0 457842.0 5439086.205 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58793_416_393222_104842">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439084.205 112.8 457842.12 5439084.205 112.8 457842.12 5439086.205 112.8 457842.0 5439086.205 112.8 457842.0 5439084.205 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58794_397_290407_425276">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439091.495 114.0 457842.12 5439091.495 114.0 457842.12 5439089.495 114.0 457842.0 5439089.495 114.0 457842.0 5439091.495 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58795_1164_574220_320141">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439089.495 114.0 457842.12 5439089.495 114.0 457842.12 5439089.495 112.8 457842.0 5439089.495 112.8 457842.0 5439089.495 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58796_1723_375485_410870">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439086.205 112.8 457842.12 5439086.205 112.8 457842.12 5439086.205 114.0 457842.0 5439086.205 114.0 457842.0 5439086.205 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58797_1512_530222_357889">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.505 112.0 457842.2 5439088.505 112.0 457842.2 5439088.505 114.01 457842.0 5439088.505 114.01 457842.0 5439088.505 112.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58798_713_434939_29079">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.505 112.0 457842.0 5439087.495 112.0 457842.2 5439087.495 112.0 457842.2 5439088.505 112.0 457842.0 5439088.505 112.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58799_1369_443926_175858">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.495 114.01 457842.2 5439087.495 114.01 457842.2 5439087.495 112.0 457842.0 5439087.495 112.0 457842.0 5439087.495 114.01</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58800_1903_739625_389368">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439091.495 112.8 457842.12 5439091.495 112.8 457842.12 5439091.495 114.0 457842.0 5439091.495 114.0 457842.0 5439091.495 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58801_882_806674_392883">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439089.495 112.8 457842.12 5439089.495 112.8 457842.12 5439091.495 112.8 457842.0 5439091.495 112.8 457842.0 5439089.495 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58802_1543_379123_11561">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.0 118.317691453624 457842.0 5439093.0 115.430940107676 457842.0 5439093.0 111.8 457842.0 5439083.0 111.8 457842.0 5439083.0 115.430940107676 457842.0 5439088.0 118.317691453624</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.48296291 116.129409522551 457842.0 5439088.46984631 116.171010071663 457842.0 5439088.45315389 116.21130913087 457842.0 5439088.4330127 116.25 457842.0 5439088.40957602 116.286788218176 457842.0 5439088.38302222 116.321393804843 457842.0 5439088.35355339 116.353553390593 457842.0 5439088.3213938 116.383022221559 457842.0 5439088.28678822 116.409576022145 457842.0 5439088.25 116.433012701892 457842.0 5439088.21130913 116.453153893518 457842.0 5439088.17101007 116.469846310393 457842.0 5439088.12940952 116.482962913145 457842.0 5439088.08682409 116.492403876506 457842.0 5439088.04357787 116.498097349046 457842.0 5439088.0 116.5 457842.0 5439087.95642213 116.498097349046 457842.0 5439087.91317591 116.492403876506 457842.0 5439087.87059048 116.482962913145 457842.0 5439087.82898993 116.469846310393 457842.0 5439087.78869087 116.453153893518 457842.0 5439087.75 116.433012701892 457842.0 5439087.71321178 116.409576022145 457842.0 5439087.6786062 116.383022221559 457842.0 5439087.64644661 116.353553390593 457842.0 5439087.61697778 116.321393804843 457842.0 5439087.59042398 116.286788218176 457842.0 5439087.5669873 116.25 457842.0 5439087.54684611 116.21130913087 457842.0 5439087.53015369 116.171010071663 457842.0 5439087.51703709 116.129409522551 457842.0 5439087.50759612 116.086824088833 457842.0 5439087.50190265 116.043577871374 457842.0 5439087.5 116.0 457842.0 5439087.50190265 115.956422128626 457842.0 5439087.50759612 115.913175911167 457842.0 5439087.51703709 115.870590477449 457842.0 5439087.53015369 115.828989928337 457842.0 5439087.54684611 115.78869086913 457842.0 5439087.5669873 115.75 457842.0 5439087.59042398 115.713211781824 457842.0 5439087.61697778 115.678606195157 457842.0 5439087.64644661 115.646446609407 457842.0 5439087.6786062 115.616977778441 457842.0 5439087.71321178 115.590423977855 457842.0 5439087.75 115.566987298108 457842.0 5439087.78869087 115.546846106482 457842.0 5439087.82898993 115.530153689607 457842.0 5439087.87059048 115.517037086855 457842.0 5439087.91317591 115.507596123494 457842.0 5439087.95642213 115.501902650954 457842.0 5439088.0 115.5 457842.0 5439088.04357787 115.501902650954 457842.0 5439088.08682409 115.507596123494 457842.0 5439088.12940952 115.517037086855 457842.0 5439088.17101007 115.530153689607 457842.0 5439088.21130913 115.546846106482 457842.0 5439088.25 115.566987298108 457842.0 5439088.28678822 115.590423977855 457842.0 5439088.3213938 115.616977778441 457842.0 5439088.35355339 115.646446609407 457842.0 5439088.38302222 115.678606195157 457842.0 5439088.40957602 115.713211781824 457842.0 5439088.4330127 115.75 457842.0 5439088.45315389 115.78869086913 457842.0 5439088.46984631 115.828989928337 457842.0 5439088.48296291 115.870590477449 457842.0 5439088.49240388 115.913175911167 457842.0 5439088.49809735 115.956422128626 457842.0 5439088.5 116.0 457842.0 5439088.49809735 116.043577871374 457842.0 5439088.49240388 116.086824088833 457842.0 5439088.48296291 116.129409522551</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439087.495 114.01 457842.0 5439087.495 112.0 457842.0 5439088.505 112.0 457842.0 5439088.505 114.01 457842.0 5439087.495 114.01</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439089.495 114.0 457842.0 5439089.495 112.8 457842.0 5439091.495 112.8 457842.0 5439091.495 114.0 457842.0 5439089.495 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439086.205 114.0 457842.0 5439084.205 114.0 457842.0 5439084.205 112.8 457842.0 5439086.205 112.8 457842.0 5439086.205 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod3MultiSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_356b85c1-25a0-49f9-b39e-013fbbafcce4">
              <gml:name>Window Round</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_fe229839-f19b-4cfd-985f-9407c4adb7c5">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58803_371_698036_77126">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457842.12 5439088.40957602 116.286788218176 457842.12 5439088.4330127 116.25 457842.12 5439088.45315389 116.21130913087 457842.12 5439088.46984631 116.171010071663 457842.12 5439088.48296291 116.129409522551 457842.12 5439088.49240388 116.086824088833 457842.12 5439088.49809735 116.043577871374 457842.12 5439088.5 116.0 457842.12 5439088.49809735 115.956422128626 457842.12 5439088.49240388 115.913175911167 457842.12 5439088.48296291 115.870590477449 457842.12 5439088.46984631 115.828989928337 457842.12 5439088.45315389 115.78869086913 457842.12 5439088.4330127 115.75 457842.12 5439088.40957602 115.713211781824 457842.12 5439088.38302222 115.678606195157 457842.12 5439088.35355339 115.646446609407 457842.12 5439088.3213938 115.616977778441 457842.12 5439088.28678822 115.590423977855 457842.12 5439088.25 115.566987298108 457842.12 5439088.21130913 115.546846106482 457842.12 5439088.17101007 115.530153689607 457842.12 5439088.12940952 115.517037086855 457842.12 5439088.08682409 115.507596123494 457842.12 5439088.04357787 115.501902650954 457842.12 5439088.0 115.5 457842.12 5439087.95642213 115.501902650954 457842.12 5439087.91317591 115.507596123494 457842.12 5439087.87059048 115.517037086855 457842.12 5439087.82898993 115.530153689607 457842.12 5439087.78869087 115.546846106482 457842.12 5439087.75 115.566987298108 457842.12 5439087.71321178 115.590423977855 457842.12 5439087.6786062 115.616977778441 457842.12 5439087.64644661 115.646446609407 457842.12 5439087.61697778 115.678606195157 457842.12 5439087.59042398 115.713211781824 457842.12 5439087.5669873 115.75 457842.12 5439087.54684611 115.78869086913 457842.12 5439087.53015369 115.828989928337 457842.12 5439087.51703709 115.870590477449 457842.12 5439087.50759612 115.913175911167 457842.12 5439087.50190265 115.956422128626 457842.12 5439087.5 116.0 457842.12 5439087.50190265 116.043577871374 457842.12 5439087.50759612 116.086824088833 457842.12 5439087.51703709 116.129409522551 457842.12 5439087.53015369 116.171010071663 457842.12 5439087.54684611 116.21130913087 457842.12 5439087.5669873 116.25 457842.12 5439087.59042398 116.286788218176 457842.12 5439087.61697778 116.321393804843 457842.12 5439087.64644661 116.353553390593 457842.12 5439087.6786062 116.383022221559 457842.12 5439087.71321178 116.409576022145 457842.12 5439087.75 116.433012701892 457842.12 5439087.78869087 116.453153893518 457842.12 5439087.82898993 116.469846310393 457842.12 5439087.87059048 116.482962913145 457842.12 5439087.91317591 116.492403876506 457842.12 5439087.95642213 116.498097349046 457842.12 5439088.0 116.5 457842.12 5439088.04357787 116.498097349046 457842.12 5439088.08682409 116.492403876506 457842.12 5439088.12940952 116.482962913145 457842.12 5439088.17101007 116.469846310393 457842.12 5439088.21130913 116.453153893518 457842.12 5439088.25 116.433012701892 457842.12 5439088.28678822 116.409576022145 457842.12 5439088.3213938 116.383022221559 457842.12 5439088.35355339 116.353553390593 457842.12 5439088.38302222 116.321393804843 457842.12 5439088.40957602 116.286788218176</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_868be7d3-16c7-4dec-9ac6-5bb8ceb545bb">
              <gml:name>Window North</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_31099dc5-17f9-43ca-97bf-0ea889447a5b">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58804_647_880710_163324">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457842.12 5439089.495 114.0 457842.12 5439091.495 114.0 457842.12 5439091.495 112.8 457842.12 5439089.495 112.8 457842.12 5439089.495 114.0</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
          <con:fillingSurface>
            <con:DoorSurface gml:id="GML_c137f11d-9a8c-4126-9aeb-9a6c9b4e1cbd">
              <gml:name>Door West</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_9e662c29-f5ba-4f3b-9bf9-042c594563d9">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58805_1881_773628_351228">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457842.2 5439087.495 114.01 457842.2 5439088.505 114.01 457842.2 5439088.505 112.0 457842.2 5439087.495 112.0 457842.2 5439087.495 114.01</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:DoorSurface>
          </con:fillingSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_9e0e6137-a907-4e4b-bc30-a6b95641f4c0">
              <gml:name>Window South</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_4f4eac8f-3a0f-4b20-8d76-50ed3030dbcb">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58806_328_642559_374120">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457842.12 5439086.205 112.8 457842.12 5439084.205 112.8 457842.12 5439084.205 114.0 457842.12 5439086.205 114.0 457842.12 5439086.205 112.8</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
        </con:WallSurface>
      </boundary>
      <boundary>
        <con:WallSurface gml:id="GML_d38cf762-c29d-4491-88c9-bdc89e141978">
          <gml:name>Outer Wall 2 (South)</gml:name>
          <lod3MultiSurface>
            <gml:MultiSurface gml:id="ID_4f6f17eb-2f26-4317-bd2f-6efde46a4121">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58807_717_125437_84247">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457849.005 5439083.0 114.375 457849.005 5439083.2 114.375 457849.005 5439083.2 112.0 457849.005 5439083.0 112.0 457849.005 5439083.0 114.375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58808_349_692294_125678">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457852.21 5439083.0 114.0 457852.21 5439083.12 114.0 457852.21 5439083.12 112.8 457852.21 5439083.0 112.8 457852.21 5439083.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58809_472_527501_416856">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457845.79 5439083.0 114.0 457845.79 5439083.12 114.0 457845.79 5439083.12 112.8 457845.79 5439083.0 112.8 457845.79 5439083.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58810_1807_553097_148846">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457845.79 5439083.0 112.8 457845.79 5439083.12 112.8 457843.79 5439083.12 112.8 457843.79 5439083.0 112.8 457845.79 5439083.0 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58811_1622_73903_56220">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457846.995 5439083.0 114.375 457846.995 5439083.2 114.375 457849.005 5439083.2 114.375 457849.005 5439083.0 114.375 457846.995 5439083.0 114.375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58812_795_350114_216214">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457843.79 5439083.0 112.8 457843.79 5439083.12 112.8 457843.79 5439083.12 114.0 457843.79 5439083.0 114.0 457843.79 5439083.0 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58813_1099_461650_222485">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457846.995 5439083.0 112.0 457846.995 5439083.2 112.0 457846.995 5439083.2 114.375 457846.995 5439083.0 114.375 457846.995 5439083.0 112.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58814_1459_649731_52436">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457850.21 5439083.0 114.0 457850.21 5439083.12 114.0 457852.21 5439083.12 114.0 457852.21 5439083.0 114.0 457850.21 5439083.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58815_691_101880_418020">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457850.21 5439083.0 112.8 457850.21 5439083.12 112.8 457850.21 5439083.12 114.0 457850.21 5439083.0 114.0 457850.21 5439083.0 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58816_858_312337_86583">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457846.995 5439083.0 112.0 457849.005 5439083.0 112.0 457849.005 5439083.2 112.0 457846.995 5439083.2 112.0 457846.995 5439083.0 112.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58817_701_101369_361161">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457852.21 5439083.0 112.8 457852.21 5439083.12 112.8 457850.21 5439083.12 112.8 457850.21 5439083.0 112.8 457852.21 5439083.0 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58818_1640_464682_59215">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457843.79 5439083.0 114.0 457843.79 5439083.12 114.0 457845.79 5439083.12 114.0 457845.79 5439083.0 114.0 457843.79 5439083.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58819_65_364244_211813">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439083.0 115.430940107676 457842.0 5439083.0 115.430940107676 457842.0 5439083.0 111.8 457854.0 5439083.0 111.8 457854.0 5439083.0 115.430940107676</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457849.005 5439083.0 114.375 457849.005 5439083.0 112.0 457846.995 5439083.0 112.0 457846.995 5439083.0 114.375 457849.005 5439083.0 114.375</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457850.21 5439083.0 114.0 457852.21 5439083.0 114.0 457852.21 5439083.0 112.8 457850.21 5439083.0 112.8 457850.21 5439083.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457845.79 5439083.0 112.8 457843.79 5439083.0 112.8 457843.79 5439083.0 114.0 457845.79 5439083.0 114.0 457845.79 5439083.0 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod3MultiSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_98d9c4f5-9e47-4f0b-95f3-cf31e7520142">
              <gml:name>Window East</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_ba3d18cd-cf22-4516-ab57-29cce22e7c9c">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58820_1568_227087_210505">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457852.21 5439083.12 112.8 457852.21 5439083.12 114.0 457850.21 5439083.12 114.0 457850.21 5439083.12 112.8 457852.21 5439083.12 112.8</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_d0f329f3-5b05-428d-87c3-945b3868337f">
              <gml:name>Window West</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_b0017721-0150-44f4-a762-1e2176a7cdb6">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58821_1939_612838_272028">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457843.79 5439083.12 112.8 457845.79 5439083.12 112.8 457845.79 5439083.12 114.0 457843.79 5439083.12 114.0 457843.79 5439083.12 112.8</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
          <con:fillingSurface>
            <con:DoorSurface gml:id="GML_2d6ddf04-ee56-42a1-a9b1-b47e4181a629">
              <gml:name>Door South</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_280da40c-d271-4be7-be60-fb52d97cd37f">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58822_551_84845_215911">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457849.005 5439083.2 112.0 457849.005 5439083.2 114.375 457846.995 5439083.2 114.375 457846.995 5439083.2 112.0 457849.005 5439083.2 112.0</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:DoorSurface>
          </con:fillingSurface>
        </con:WallSurface>
      </boundary>
      <boundary>
        <con:WallSurface gml:id="GML_8e5db638-e46a-4739-a98a-2fc2d39c9069">
          <gml:name>Outer Wall 3 (East)</gml:name>
          <lod3MultiSurface>
            <gml:MultiSurface gml:id="ID_83e03b6b-29aa-475c-96cf-49b7b26a4ad9">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58823_570_138008_107322">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.78869087 115.546846106482 457853.87 5439087.78869087 115.546846106482 457853.87 5439087.75 115.566987298108 457854.0 5439087.75 115.566987298108 457854.0 5439087.78869087 115.546846106482</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58824_439_290766_393776">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.87059048 116.482962913145 457853.87 5439087.87059048 116.482962913145 457853.87 5439087.91317591 116.492403876506 457854.0 5439087.91317591 116.492403876506 457854.0 5439087.87059048 116.482962913145</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58825_1589_638409_186400">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.04357787 116.498097349046 457853.87 5439088.04357787 116.498097349046 457853.87 5439088.08682409 116.492403876506 457854.0 5439088.08682409 116.492403876506 457854.0 5439088.04357787 116.498097349046</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58826_766_578922_7381">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.45315389 116.21130913087 457853.87 5439088.45315389 116.21130913087 457853.87 5439088.46984631 116.171010071663 457854.0 5439088.46984631 116.171010071663 457854.0 5439088.45315389 116.21130913087</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58827_1782_330817_188911">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.49240388 115.913175911167 457853.87 5439088.49240388 115.913175911167 457853.87 5439088.48296291 115.870590477449 457854.0 5439088.48296291 115.870590477449 457854.0 5439088.49240388 115.913175911167</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58828_1522_308899_25855">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.49809735 115.956422128626 457853.87 5439088.49809735 115.956422128626 457853.87 5439088.49240388 115.913175911167 457854.0 5439088.49240388 115.913175911167 457854.0 5439088.49809735 115.956422128626</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58829_953_361344_310520">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.40957602 115.713211781824 457853.87 5439088.40957602 115.713211781824 457853.87 5439088.38302222 115.678606195157 457854.0 5439088.38302222 115.678606195157 457854.0 5439088.40957602 115.713211781824</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58830_12_172372_362873">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.50759612 115.913175911167 457853.87 5439087.50759612 115.913175911167 457853.87 5439087.50190265 115.956422128626 457854.0 5439087.50190265 115.956422128626 457854.0 5439087.50759612 115.913175911167</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58831_1162_492249_346547">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.59042398 116.286788218176 457853.87 5439087.59042398 116.286788218176 457853.87 5439087.61697778 116.321393804843 457854.0 5439087.61697778 116.321393804843 457854.0 5439087.59042398 116.286788218176</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58832_649_212520_225345">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.91317591 115.507596123494 457853.87 5439087.91317591 115.507596123494 457853.87 5439087.87059048 115.517037086855 457854.0 5439087.87059048 115.517037086855 457854.0 5439087.91317591 115.507596123494</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58833_1455_377730_279429">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.54684611 116.21130913087 457853.87 5439087.54684611 116.21130913087 457853.87 5439087.5669873 116.25 457854.0 5439087.5669873 116.25 457854.0 5439087.54684611 116.21130913087</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58834_336_613769_96500">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.59042398 115.713211781824 457853.87 5439087.59042398 115.713211781824 457853.87 5439087.5669873 115.75 457854.0 5439087.5669873 115.75 457854.0 5439087.59042398 115.713211781824</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58835_1650_623307_361645">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.21130913 115.546846106482 457853.87 5439088.21130913 115.546846106482 457853.87 5439088.17101007 115.530153689607 457854.0 5439088.17101007 115.530153689607 457854.0 5439088.21130913 115.546846106482</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58836_1456_865943_237319">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.78869087 116.453153893518 457853.87 5439087.78869087 116.453153893518 457853.87 5439087.82898993 116.469846310393 457854.0 5439087.82898993 116.469846310393 457854.0 5439087.78869087 116.453153893518</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58837_1583_77116_269612">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.21130913 116.453153893518 457853.87 5439088.21130913 116.453153893518 457853.87 5439088.25 116.433012701892 457854.0 5439088.25 116.433012701892 457854.0 5439088.21130913 116.453153893518</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58838_707_749636_174617">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.28678822 115.590423977855 457853.87 5439088.28678822 115.590423977855 457853.87 5439088.25 115.566987298108 457854.0 5439088.25 115.566987298108 457854.0 5439088.28678822 115.590423977855</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58839_1996_96543_56894">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.51703709 115.870590477449 457853.87 5439087.51703709 115.870590477449 457853.87 5439087.50759612 115.913175911167 457854.0 5439087.50759612 115.913175911167 457854.0 5439087.51703709 115.870590477449</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58840_1096_855539_244285">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.46984631 116.171010071663 457853.87 5439088.46984631 116.171010071663 457853.87 5439088.48296291 116.129409522551 457854.0 5439088.48296291 116.129409522551 457854.0 5439088.46984631 116.171010071663</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58841_392_624392_8151">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.61697778 115.678606195157 457853.87 5439087.61697778 115.678606195157 457853.87 5439087.59042398 115.713211781824 457854.0 5439087.59042398 115.713211781824 457854.0 5439087.61697778 115.678606195157</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58842_1595_491700_282570">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.48296291 116.129409522551 457853.87 5439088.48296291 116.129409522551 457853.87 5439088.49240388 116.086824088833 457854.0 5439088.49240388 116.086824088833 457854.0 5439088.48296291 116.129409522551</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58843_1862_478243_373176">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.04357787 115.501902650954 457853.87 5439088.04357787 115.501902650954 457853.87 5439088.0 115.5 457854.0 5439088.0 115.5 457854.0 5439088.04357787 115.501902650954</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58844_293_862667_200176">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.3213938 115.616977778441 457853.87 5439088.3213938 115.616977778441 457853.87 5439088.28678822 115.590423977855 457854.0 5439088.28678822 115.590423977855 457854.0 5439088.3213938 115.616977778441</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58845_1505_99391_314552">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.40957602 116.286788218176 457853.87 5439088.40957602 116.286788218176 457853.87 5439088.4330127 116.25 457854.0 5439088.4330127 116.25 457854.0 5439088.40957602 116.286788218176</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58846_1607_419091_114346">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.64644661 116.353553390593 457853.87 5439087.64644661 116.353553390593 457853.87 5439087.6786062 116.383022221559 457854.0 5439087.6786062 116.383022221559 457854.0 5439087.64644661 116.353553390593</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58847_90_140038_409167">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.28678822 116.409576022145 457853.87 5439088.28678822 116.409576022145 457853.87 5439088.3213938 116.383022221559 457854.0 5439088.3213938 116.383022221559 457854.0 5439088.28678822 116.409576022145</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58848_1643_368347_161032">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.49240388 116.086824088833 457853.87 5439088.49240388 116.086824088833 457853.87 5439088.49809735 116.043577871374 457854.0 5439088.49809735 116.043577871374 457854.0 5439088.49240388 116.086824088833</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58849_1037_422449_337587">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.53015369 115.828989928337 457853.87 5439087.53015369 115.828989928337 457853.87 5439087.51703709 115.870590477449 457854.0 5439087.51703709 115.870590477449 457854.0 5439087.53015369 115.828989928337</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58850_1035_615015_167623">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.35355339 116.353553390593 457853.87 5439088.35355339 116.353553390593 457853.87 5439088.38302222 116.321393804843 457854.0 5439088.38302222 116.321393804843 457854.0 5439088.35355339 116.353553390593</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58851_1589_798265_173568">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.17101007 115.530153689607 457853.87 5439088.17101007 115.530153689607 457853.87 5439088.12940952 115.517037086855 457854.0 5439088.12940952 115.517037086855 457854.0 5439088.17101007 115.530153689607</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58852_1403_247001_10369">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.87059048 115.517037086855 457853.87 5439087.87059048 115.517037086855 457853.87 5439087.82898993 115.530153689607 457854.0 5439087.82898993 115.530153689607 457854.0 5439087.87059048 115.517037086855</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58853_1615_480753_1407">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.38302222 116.321393804843 457853.87 5439088.38302222 116.321393804843 457853.87 5439088.40957602 116.286788218176 457854.0 5439088.40957602 116.286788218176 457854.0 5439088.38302222 116.321393804843</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58854_1444_67764_179010">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.08682409 115.507596123494 457853.87 5439088.08682409 115.507596123494 457853.87 5439088.04357787 115.501902650954 457854.0 5439088.04357787 115.501902650954 457854.0 5439088.08682409 115.507596123494</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58855_566_600693_272738">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.5669873 115.75 457853.87 5439087.5669873 115.75 457853.87 5439087.54684611 115.78869086913 457854.0 5439087.54684611 115.78869086913 457854.0 5439087.5669873 115.75</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58856_812_63520_36025">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.5 116.0 457853.87 5439087.5 116.0 457853.87 5439087.50190265 116.043577871374 457854.0 5439087.50190265 116.043577871374 457854.0 5439087.5 116.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58857_553_455273_290230">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.4330127 116.25 457853.87 5439088.4330127 116.25 457853.87 5439088.45315389 116.21130913087 457854.0 5439088.45315389 116.21130913087 457854.0 5439088.4330127 116.25</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58858_311_115612_297940">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.46984631 115.828989928337 457853.87 5439088.46984631 115.828989928337 457853.87 5439088.45315389 115.78869086913 457854.0 5439088.45315389 115.78869086913 457854.0 5439088.46984631 115.828989928337</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58859_1105_560490_423671">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.6786062 116.383022221559 457853.87 5439087.6786062 116.383022221559 457853.87 5439087.71321178 116.409576022145 457854.0 5439087.71321178 116.409576022145 457854.0 5439087.6786062 116.383022221559</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58860_1517_658785_414270">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.0 116.5 457853.87 5439088.0 116.5 457853.87 5439088.04357787 116.498097349046 457854.0 5439088.04357787 116.498097349046 457854.0 5439088.0 116.5</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58861_396_754114_102807">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.12940952 116.482962913145 457853.87 5439088.12940952 116.482962913145 457853.87 5439088.17101007 116.469846310393 457854.0 5439088.17101007 116.469846310393 457854.0 5439088.12940952 116.482962913145</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58862_1508_661324_353344">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.82898993 115.530153689607 457853.87 5439087.82898993 115.530153689607 457853.87 5439087.78869087 115.546846106482 457854.0 5439087.78869087 115.546846106482 457854.0 5439087.82898993 115.530153689607</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58863_1761_209205_363750">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.95642213 115.501902650954 457853.87 5439087.95642213 115.501902650954 457853.87 5439087.91317591 115.507596123494 457854.0 5439087.91317591 115.507596123494 457854.0 5439087.95642213 115.501902650954</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58864_266_525477_126998">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.50190265 115.956422128626 457853.87 5439087.50190265 115.956422128626 457853.87 5439087.5 116.0 457854.0 5439087.5 116.0 457854.0 5439087.50190265 115.956422128626</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58865_526_15168_228546">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.45315389 115.78869086913 457853.87 5439088.45315389 115.78869086913 457853.87 5439088.4330127 115.75 457854.0 5439088.4330127 115.75 457854.0 5439088.45315389 115.78869086913</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58866_156_725100_178245">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.25 116.433012701892 457853.87 5439088.25 116.433012701892 457853.87 5439088.28678822 116.409576022145 457854.0 5439088.28678822 116.409576022145 457854.0 5439088.25 116.433012701892</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58867_1367_497472_296633">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.25 115.566987298108 457853.87 5439088.25 115.566987298108 457853.87 5439088.21130913 115.546846106482 457854.0 5439088.21130913 115.546846106482 457854.0 5439088.25 115.566987298108</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58868_724_854947_375866">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.95642213 116.498097349046 457853.87 5439087.95642213 116.498097349046 457853.87 5439088.0 116.5 457854.0 5439088.0 116.5 457854.0 5439087.95642213 116.498097349046</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58869_119_43728_205515">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.0 115.5 457853.87 5439088.0 115.5 457853.87 5439087.95642213 115.501902650954 457854.0 5439087.95642213 115.501902650954 457854.0 5439088.0 115.5</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58870_1860_438101_33103">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.3213938 116.383022221559 457853.87 5439088.3213938 116.383022221559 457853.87 5439088.35355339 116.353553390593 457854.0 5439088.35355339 116.353553390593 457854.0 5439088.3213938 116.383022221559</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58871_329_330460_187159">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.5 116.0 457853.87 5439088.5 116.0 457853.87 5439088.49809735 115.956422128626 457854.0 5439088.49809735 115.956422128626 457854.0 5439088.5 116.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58872_1035_165516_336492">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.50759612 116.086824088833 457853.87 5439087.50759612 116.086824088833 457853.87 5439087.51703709 116.129409522551 457854.0 5439087.51703709 116.129409522551 457854.0 5439087.50759612 116.086824088833</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58873_1558_279514_43072">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.17101007 116.469846310393 457853.87 5439088.17101007 116.469846310393 457853.87 5439088.21130913 116.453153893518 457854.0 5439088.21130913 116.453153893518 457854.0 5439088.17101007 116.469846310393</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58874_707_866165_220822">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.50190265 116.043577871374 457853.87 5439087.50190265 116.043577871374 457853.87 5439087.50759612 116.086824088833 457854.0 5439087.50759612 116.086824088833 457854.0 5439087.50190265 116.043577871374</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58875_248_685565_291683">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.08682409 116.492403876506 457853.87 5439088.08682409 116.492403876506 457853.87 5439088.12940952 116.482962913145 457854.0 5439088.12940952 116.482962913145 457854.0 5439088.08682409 116.492403876506</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58876_1646_212881_351851">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.35355339 115.646446609407 457853.87 5439088.35355339 115.646446609407 457853.87 5439088.3213938 115.616977778441 457854.0 5439088.3213938 115.616977778441 457854.0 5439088.35355339 115.646446609407</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58877_462_742322_212929">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.4330127 115.75 457853.87 5439088.4330127 115.75 457853.87 5439088.40957602 115.713211781824 457854.0 5439088.40957602 115.713211781824 457854.0 5439088.4330127 115.75</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58878_1780_17352_191996">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.82898993 116.469846310393 457853.87 5439087.82898993 116.469846310393 457853.87 5439087.87059048 116.482962913145 457854.0 5439087.87059048 116.482962913145 457854.0 5439087.82898993 116.469846310393</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58879_886_751312_428816">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.71321178 116.409576022145 457853.87 5439087.71321178 116.409576022145 457853.87 5439087.75 116.433012701892 457854.0 5439087.75 116.433012701892 457854.0 5439087.71321178 116.409576022145</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58880_589_43766_423768">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.54684611 115.78869086913 457853.87 5439087.54684611 115.78869086913 457853.87 5439087.53015369 115.828989928337 457854.0 5439087.53015369 115.828989928337 457854.0 5439087.54684611 115.78869086913</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58881_71_863606_40602">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.51703709 116.129409522551 457853.87 5439087.51703709 116.129409522551 457853.87 5439087.53015369 116.171010071663 457854.0 5439087.53015369 116.171010071663 457854.0 5439087.51703709 116.129409522551</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58882_1691_230441_40603">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.6786062 115.616977778441 457853.87 5439087.6786062 115.616977778441 457853.87 5439087.64644661 115.646446609407 457854.0 5439087.64644661 115.646446609407 457854.0 5439087.6786062 115.616977778441</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58883_1037_687764_121563">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.75 116.433012701892 457853.87 5439087.75 116.433012701892 457853.87 5439087.78869087 116.453153893518 457854.0 5439087.78869087 116.453153893518 457854.0 5439087.75 116.433012701892</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58884_1627_899224_389116">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.12940952 115.517037086855 457853.87 5439088.12940952 115.517037086855 457853.87 5439088.08682409 115.507596123494 457854.0 5439088.08682409 115.507596123494 457854.0 5439088.12940952 115.517037086855</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58885_876_846116_316992">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.49809735 116.043577871374 457853.87 5439088.49809735 116.043577871374 457853.87 5439088.5 116.0 457854.0 5439088.5 116.0 457854.0 5439088.49809735 116.043577871374</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58886_933_860878_127263">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.64644661 115.646446609407 457853.87 5439087.64644661 115.646446609407 457853.87 5439087.61697778 115.678606195157 457854.0 5439087.61697778 115.678606195157 457854.0 5439087.64644661 115.646446609407</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58887_1993_113857_311904">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.38302222 115.678606195157 457853.87 5439088.38302222 115.678606195157 457853.87 5439088.35355339 115.646446609407 457854.0 5439088.35355339 115.646446609407 457854.0 5439088.38302222 115.678606195157</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58888_351_262296_414185">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.61697778 116.321393804843 457853.87 5439087.61697778 116.321393804843 457853.87 5439087.64644661 116.353553390593 457854.0 5439087.64644661 116.353553390593 457854.0 5439087.61697778 116.321393804843</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58889_1267_437476_45575">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.71321178 115.590423977855 457853.87 5439087.71321178 115.590423977855 457853.87 5439087.6786062 115.616977778441 457854.0 5439087.6786062 115.616977778441 457854.0 5439087.71321178 115.590423977855</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58890_1586_699919_109999">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.48296291 115.870590477449 457853.87 5439088.48296291 115.870590477449 457853.87 5439088.46984631 115.828989928337 457854.0 5439088.46984631 115.828989928337 457854.0 5439088.48296291 115.870590477449</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58891_1570_83267_355718">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.75 115.566987298108 457853.87 5439087.75 115.566987298108 457853.87 5439087.71321178 115.590423977855 457854.0 5439087.71321178 115.590423977855 457854.0 5439087.75 115.566987298108</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58892_1716_836988_157786">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.5669873 116.25 457853.87 5439087.5669873 116.25 457853.87 5439087.59042398 116.286788218176 457854.0 5439087.59042398 116.286788218176 457854.0 5439087.5669873 116.25</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58893_523_674478_365336">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.91317591 116.492403876506 457853.87 5439087.91317591 116.492403876506 457853.87 5439087.95642213 116.498097349046 457854.0 5439087.95642213 116.498097349046 457854.0 5439087.91317591 116.492403876506</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58894_1798_71247_374813">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.53015369 116.171010071663 457853.87 5439087.53015369 116.171010071663 457853.87 5439087.54684611 116.21130913087 457854.0 5439087.54684611 116.21130913087 457854.0 5439087.53015369 116.171010071663</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58895_177_729072_1359">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439091.50239372 112.8 457853.88 5439091.50239372 112.8 457853.88 5439089.50239372 112.8 457854.0 5439089.50239372 112.8 457854.0 5439091.50239372 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58896_1460_485806_164686">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439091.50239372 114.0 457853.88 5439091.50239372 114.0 457853.88 5439091.50239372 112.8 457854.0 5439091.50239372 112.8 457854.0 5439091.50239372 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58897_1185_441649_380580">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439086.205 112.8 457853.88 5439086.205 112.8 457853.88 5439084.205 112.8 457854.0 5439084.205 112.8 457854.0 5439086.205 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58898_158_629934_409515">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439089.50239372 114.0 457853.88 5439089.50239372 114.0 457853.88 5439091.50239372 114.0 457854.0 5439091.50239372 114.0 457854.0 5439089.50239372 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58899_1460_365559_91271">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439089.50239372 112.8 457853.88 5439089.50239372 112.8 457853.88 5439089.50239372 114.0 457854.0 5439089.50239372 114.0 457854.0 5439089.50239372 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58900_306_139976_395379">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439084.205 112.8 457853.88 5439084.205 112.8 457853.88 5439084.205 114.0 457854.0 5439084.205 114.0 457854.0 5439084.205 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58901_953_311220_138631">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439084.205 114.0 457853.88 5439084.205 114.0 457853.88 5439086.205 114.0 457854.0 5439086.205 114.0 457854.0 5439084.205 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58902_1537_85954_306182">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439086.205 114.0 457853.88 5439086.205 114.0 457853.88 5439086.205 112.8 457854.0 5439086.205 112.8 457854.0 5439086.205 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58903_1839_642244_370862">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439088.0 118.317691453624 457854.0 5439083.0 115.430940107676 457854.0 5439083.0 111.8 457854.0 5439093.0 111.8 457854.0 5439093.0 115.430940107676 457854.0 5439088.0 118.317691453624</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439087.51703709 116.129409522551 457854.0 5439087.53015369 116.171010071663 457854.0 5439087.54684611 116.21130913087 457854.0 5439087.5669873 116.25 457854.0 5439087.59042398 116.286788218176 457854.0 5439087.61697778 116.321393804843 457854.0 5439087.64644661 116.353553390593 457854.0 5439087.6786062 116.383022221559 457854.0 5439087.71321178 116.409576022145 457854.0 5439087.75 116.433012701892 457854.0 5439087.78869087 116.453153893518 457854.0 5439087.82898993 116.469846310393 457854.0 5439087.87059048 116.482962913145 457854.0 5439087.91317591 116.492403876506 457854.0 5439087.95642213 116.498097349046 457854.0 5439088.0 116.5 457854.0 5439088.04357787 116.498097349046 457854.0 5439088.08682409 116.492403876506 457854.0 5439088.12940952 116.482962913145 457854.0 5439088.17101007 116.469846310393 457854.0 5439088.21130913 116.453153893518 457854.0 5439088.25 116.433012701892 457854.0 5439088.28678822 116.409576022145 457854.0 5439088.3213938 116.383022221559 457854.0 5439088.35355339 116.353553390593 457854.0 5439088.38302222 116.321393804843 457854.0 5439088.40957602 116.286788218176 457854.0 5439088.4330127 116.25 457854.0 5439088.45315389 116.21130913087 457854.0 5439088.46984631 116.171010071663 457854.0 5439088.48296291 116.129409522551 457854.0 5439088.49240388 116.086824088833 457854.0 5439088.49809735 116.043577871374 457854.0 5439088.5 116.0 457854.0 5439088.49809735 115.956422128626 457854.0 5439088.49240388 115.913175911167 457854.0 5439088.48296291 115.870590477449 457854.0 5439088.46984631 115.828989928337 457854.0 5439088.45315389 115.78869086913 457854.0 5439088.4330127 115.75 457854.0 5439088.40957602 115.713211781824 457854.0 5439088.38302222 115.678606195157 457854.0 5439088.35355339 115.646446609407 457854.0 5439088.3213938 115.616977778441 457854.0 5439088.28678822 115.590423977855 457854.0 5439088.25 115.566987298108 457854.0 5439088.21130913 115.546846106482 457854.0 5439088.17101007 115.530153689607 457854.0 5439088.12940952 115.517037086855 457854.0 5439088.08682409 115.507596123494 457854.0 5439088.04357787 115.501902650954 457854.0 5439088.0 115.5 457854.0 5439087.95642213 115.501902650954 457854.0 5439087.91317591 115.507596123494 457854.0 5439087.87059048 115.517037086855 457854.0 5439087.82898993 115.530153689607 457854.0 5439087.78869087 115.546846106482 457854.0 5439087.75 115.566987298108 457854.0 5439087.71321178 115.590423977855 457854.0 5439087.6786062 115.616977778441 457854.0 5439087.64644661 115.646446609407 457854.0 5439087.61697778 115.678606195157 457854.0 5439087.59042398 115.713211781824 457854.0 5439087.5669873 115.75 457854.0 5439087.54684611 115.78869086913 457854.0 5439087.53015369 115.828989928337 457854.0 5439087.51703709 115.870590477449 457854.0 5439087.50759612 115.913175911167 457854.0 5439087.50190265 115.956422128626 457854.0 5439087.5 116.0 457854.0 5439087.50190265 116.043577871374 457854.0 5439087.50759612 116.086824088833 457854.0 5439087.51703709 116.129409522551</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439091.50239372 114.0 457854.0 5439091.50239372 112.8 457854.0 5439089.50239372 112.8 457854.0 5439089.50239372 114.0 457854.0 5439091.50239372 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439084.205 112.8 457854.0 5439084.205 114.0 457854.0 5439086.205 114.0 457854.0 5439086.205 112.8 457854.0 5439084.205 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod3MultiSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_ef2a1635-4f3c-48b5-afda-53c920f3132b">
              <gml:name>Window South</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_8c1e4003-c038-48c1-8294-1a1ee48342dd">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58904_926_485070_129763">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457853.88 5439086.205 112.8 457853.88 5439086.205 114.0 457853.88 5439084.205 114.0 457853.88 5439084.205 112.8 457853.88 5439086.205 112.8</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_a216460a-3326-41f2-b867-6846d81724a4">
              <gml:name>Window North</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_29a67378-35c4-4611-b1cb-c346ac948a09">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58905_883_830507_79018">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457853.88 5439091.50239372 114.0 457853.88 5439089.50239372 114.0 457853.88 5439089.50239372 112.8 457853.88 5439091.50239372 112.8 457853.88 5439091.50239372 114.0</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_23030a94-ccbc-4ce5-a0a4-9280c5b3f287">
              <gml:name>Window Round</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_946902e9-3da5-4a1e-b7bb-95b522f86def">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58906_886_364949_26381">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457853.87 5439087.61697778 116.321393804843 457853.87 5439087.59042398 116.286788218176 457853.87 5439087.5669873 116.25 457853.87 5439087.54684611 116.21130913087 457853.87 5439087.53015369 116.171010071663 457853.87 5439087.51703709 116.129409522551 457853.87 5439087.50759612 116.086824088833 457853.87 5439087.50190265 116.043577871374 457853.87 5439087.5 116.0 457853.87 5439087.50190265 115.956422128626 457853.87 5439087.50759612 115.913175911167 457853.87 5439087.51703709 115.870590477449 457853.87 5439087.53015369 115.828989928337 457853.87 5439087.54684611 115.78869086913 457853.87 5439087.5669873 115.75 457853.87 5439087.59042398 115.713211781824 457853.87 5439087.61697778 115.678606195157 457853.87 5439087.64644661 115.646446609407 457853.87 5439087.6786062 115.616977778441 457853.87 5439087.71321178 115.590423977855 457853.87 5439087.75 115.566987298108 457853.87 5439087.78869087 115.546846106482 457853.87 5439087.82898993 115.530153689607 457853.87 5439087.87059048 115.517037086855 457853.87 5439087.91317591 115.507596123494 457853.87 5439087.95642213 115.501902650954 457853.87 5439088.0 115.5 457853.87 5439088.04357787 115.501902650954 457853.87 5439088.08682409 115.507596123494 457853.87 5439088.12940952 115.517037086855 457853.87 5439088.17101007 115.530153689607 457853.87 5439088.21130913 115.546846106482 457853.87 5439088.25 115.566987298108 457853.87 5439088.28678822 115.590423977855 457853.87 5439088.3213938 115.616977778441 457853.87 5439088.35355339 115.646446609407 457853.87 5439088.38302222 115.678606195157 457853.87 5439088.40957602 115.713211781824 457853.87 5439088.4330127 115.75 457853.87 5439088.45315389 115.78869086913 457853.87 5439088.46984631 115.828989928337 457853.87 5439088.48296291 115.870590477449 457853.87 5439088.49240388 115.913175911167 457853.87 5439088.49809735 115.956422128626 457853.87 5439088.5 116.0 457853.87 5439088.49809735 116.043577871374 457853.87 5439088.49240388 116.086824088833 457853.87 5439088.48296291 116.129409522551 457853.87 5439088.46984631 116.171010071663 457853.87 5439088.45315389 116.21130913087 457853.87 5439088.4330127 116.25 457853.87 5439088.40957602 116.286788218176 457853.87 5439088.38302222 116.321393804843 457853.87 5439088.35355339 116.353553390593 457853.87 5439088.3213938 116.383022221559 457853.87 5439088.28678822 116.409576022145 457853.87 5439088.25 116.433012701892 457853.87 5439088.21130913 116.453153893518 457853.87 5439088.17101007 116.469846310393 457853.87 5439088.12940952 116.482962913145 457853.87 5439088.08682409 116.492403876506 457853.87 5439088.04357787 116.498097349046 457853.87 5439088.0 116.5 457853.87 5439087.95642213 116.498097349046 457853.87 5439087.91317591 116.492403876506 457853.87 5439087.87059048 116.482962913145 457853.87 5439087.82898993 116.469846310393 457853.87 5439087.78869087 116.453153893518 457853.87 5439087.75 116.433012701892 457853.87 5439087.71321178 116.409576022145 457853.87 5439087.6786062 116.383022221559 457853.87 5439087.64644661 116.353553390593 457853.87 5439087.61697778 116.321393804843</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
        </con:WallSurface>
      </boundary>
      <boundary>
        <con:RoofSurface gml:id="GML_875d470b-32b4-4985-a4c8-0f02caa342a2">
          <gml:name>Roof 1 (North)</gml:name>
          <lod3MultiSurface>
            <gml:MultiSurface gml:id="ID_5b5a7d34-0263-489b-b5d8-c6f8b9a0160f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58907_1126_884498_121000">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439088.0 118.317691453624 457854.0 5439088.0 118.317691453624 457854.0 5439093.0 115.430940107676 457842.0 5439093.0 115.430940107676 457842.0 5439088.0 118.317691453624</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58908_1911_59781_62378">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457841.5 5439088.0 118.317691453624 457842.0 5439088.0 118.317691453624 457842.0 5439093.0 115.430940107676 457854.0 5439093.0 115.430940107676 457854.0 5439088.0 118.317691453624 457854.5 5439088.0 118.317691453624 457854.5 5439093.5 115.142264973081 457841.5 5439093.5 115.142264973081 457841.5 5439088.0 118.317691453624</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod3MultiSurface>
        </con:RoofSurface>
      </boundary>
      <boundary>
        <con:WallSurface gml:id="GML_0f30f604-e70d-4dfe-ba35-853bc69609cc">
          <gml:name>Outer Wall 4 (North)</gml:name>
          <lod3MultiSurface>
            <gml:MultiSurface gml:id="ID_25768b5e-5eff-4ec4-9379-c3318eb72636">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58909_352_689036_60980">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457852.795 5439093.0 112.8 457852.795 5439092.88 112.8 457852.795 5439092.88 114.0 457852.795 5439093.0 114.0 457852.795 5439093.0 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58910_338_408556_67913">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457842.0 5439093.0 115.430940107676 457854.0 5439093.0 115.430940107676 457854.0 5439093.0 111.8 457842.0 5439093.0 111.8 457842.0 5439093.0 115.430940107676</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457843.05 5439093.0 114.0 457843.05 5439093.0 112.8 457845.05 5439093.0 112.8 457845.05 5439093.0 114.0 457843.05 5439093.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457852.795 5439093.0 114.0 457850.795 5439093.0 114.0 457850.795 5439093.0 112.8 457852.795 5439093.0 112.8 457852.795 5439093.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                  <gml:interior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457846.66 5439093.0 114.0 457846.66 5439093.0 112.8 457848.66 5439093.0 112.8 457848.66 5439093.0 114.0 457846.66 5439093.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58911_17_268945_50084">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457848.66 5439093.0 112.8 457848.66 5439092.88 112.8 457848.66 5439092.88 114.0 457848.66 5439093.0 114.0 457848.66 5439093.0 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58912_1940_702815_377183">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457850.795 5439093.0 112.8 457850.795 5439092.88 112.8 457852.795 5439092.88 112.8 457852.795 5439093.0 112.8 457850.795 5439093.0 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58913_657_341355_423224">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457850.795 5439093.0 114.0 457850.795 5439092.88 114.0 457850.795 5439092.88 112.8 457850.795 5439093.0 112.8 457850.795 5439093.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58914_1307_607941_114014">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457848.66 5439093.0 114.0 457848.66 5439092.88 114.0 457846.66 5439092.88 114.0 457846.66 5439093.0 114.0 457848.66 5439093.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58915_693_321944_318712">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457846.66 5439093.0 112.8 457846.66 5439092.88 112.8 457848.66 5439092.88 112.8 457848.66 5439093.0 112.8 457846.66 5439093.0 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58916_1618_190498_353340">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457846.66 5439093.0 114.0 457846.66 5439092.88 114.0 457846.66 5439092.88 112.8 457846.66 5439093.0 112.8 457846.66 5439093.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58917_257_573785_278141">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457852.795 5439093.0 114.0 457852.795 5439092.88 114.0 457850.795 5439092.88 114.0 457850.795 5439093.0 114.0 457852.795 5439093.0 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID45488_1878_623744_29993">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457845.05 5439092.88 114.0 457843.05 5439092.88 114.0 457843.05 5439093.0 114.0 457845.05 5439093.0 114.0 457845.05 5439092.88 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID45489_1241_160210_79540">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457845.05 5439092.88 112.8 457845.05 5439092.88 114.0 457845.05 5439093.0 114.0 457845.05 5439093.0 112.8 457845.05 5439092.88 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID45490_980_523938_205257">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457843.05 5439092.88 112.8 457845.05 5439092.88 112.8 457845.05 5439093.0 112.8 457843.05 5439093.0 112.8 457843.05 5439092.88 112.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID45491_552_178616_406087">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457843.05 5439092.88 114.0 457843.05 5439092.88 112.8 457843.05 5439093.0 112.8 457843.05 5439093.0 114.0 457843.05 5439092.88 114.0</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod3MultiSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_2297f8d4-f302-464c-8e7d-a26fd5dbd755">
              <gml:name>Window East</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_c5b20efd-00ab-46b7-bf99-87ab8eb68281">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58918_1666_508104_106792">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457852.795 5439092.88 112.8 457850.795 5439092.88 112.8 457850.795 5439092.88 114.0 457852.795 5439092.88 114.0 457852.795 5439092.88 112.8</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_6087187b-284d-4064-9abf-85f9ba9b2c89">
              <gml:name>Window Middle</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_47274975-4b9b-4637-ac71-b6b0c8a36fb0">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID58919_293_365452_56524">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457848.66 5439092.88 114.0 457848.66 5439092.88 112.8 457846.66 5439092.88 112.8 457846.66 5439092.88 114.0 457848.66 5439092.88 114.0</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
          <con:fillingSurface>
            <con:WindowSurface gml:id="GML_5397681c-8367-4e9b-a989-60caec316f86">
              <gml:name>Window West</gml:name>
              <lod3MultiSurface>
                <gml:MultiSurface gml:id="ID_6c04fed0-21dc-4dc7-a3cb-6f291bd370ad">
                  <gml:surfaceMember>
                    <gml:Polygon gml:id="PolyID45494_1549_894355_77993">
                      <gml:exterior>
                        <gml:LinearRing>
                          <gml:posList srsDimension="3">457843.05 5439092.88 112.8 457843.05 5439092.88 114.0 457845.05 5439092.88 114.0 457845.05 5439092.88 112.8 457843.05 5439092.88 112.8</gml:posList>
                        </gml:LinearRing>
                      </gml:exterior>
                    </gml:Polygon>
                  </gml:surfaceMember>
                </gml:MultiSurface>
              </lod3MultiSurface>
            </con:WindowSurface>
          </con:fillingSurface>
        </con:WallSurface>
      </boundary>
      <boundary>
        <con:RoofSurface gml:id="GML_eeb6796a-e261-4d3b-a6f2-475940cca80a">
          <gml:name>Roof 2 (South)</gml:name>
          <lod3MultiSurface>
            <gml:MultiSurface gml:id="ID_00b9c277-518a-4616-b57d-6c03255fc6bb">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58920_1537_643295_290950">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439083.0 115.430940107676 457842.0 5439083.0 115.430940107676 457842.0 5439088.0 118.317691453624 457841.5 5439088.0 118.317691453624 457841.5 5439082.5 115.142264973081 457854.5 5439082.5 115.142264973081 457854.5 5439088.0 118.317691453624 457854.0 5439088.0 118.317691453624 457854.0 5439083.0 115.430940107676</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58921_472_579834_340993">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439083.0 115.430940107676 457854.0 5439088.0 118.317691453624 457842.0 5439088.0 118.317691453624 457842.0 5439083.0 115.430940107676 457854.0 5439083.0 115.430940107676</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod3MultiSurface>
        </con:RoofSurface>
      </boundary>
      <boundary>
        <con:GroundSurface gml:id="GML_257a8dde-8194-4ca3-b581-abd591dcd6a3">
          <gml:description>Bodenplatte</gml:description>
          <gml:name>Base Surface</gml:name>
          <lod3MultiSurface>
            <gml:MultiSurface gml:id="ID_510c012b-3f1a-4932-9a67-1d98df2d2966">
              <gml:surfaceMember>
                <gml:Polygon gml:id="PolyID58922_1541_340473_350668">
                  <gml:exterior>
                    <gml:LinearRing>
                      <gml:posList srsDimension="3">457854.0 5439083.0 111.8 457842.0 5439083.0 111.8 457842.0 5439093.0 111.8 457854.0 5439093.0 111.8 457854.0 5439083.0 111.8</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </lod3MultiSurface>
        </con:GroundSurface>
      </boundary>
      <lod3Solid>
        <gml:Solid gml:id="ID_df2cb9af-a640-4bd3-a464-9c9895e9af23">
          <gml:exterior>
            <gml:Shell gml:id="ID_8bb53501-ff18-4bb8-928a-28ce16101efb">
              <gml:surfaceMember xlink:href="#PolyID58907_1126_884498_121000"/>
              <gml:surfaceMember xlink:href="#PolyID58921_472_579834_340993"/>
              <gml:surfaceMember xlink:href="#PolyID58922_1541_340473_350668"/>
              <gml:surfaceMember xlink:href="#PolyID58909_352_689036_60980"/>
              <gml:surfaceMember xlink:href="#PolyID58910_338_408556_67913"/>
              <gml:surfaceMember xlink:href="#PolyID58911_17_268945_50084"/>
              <gml:surfaceMember xlink:href="#PolyID58912_1940_702815_377183"/>
              <gml:surfaceMember xlink:href="#PolyID58913_657_341355_423224"/>
              <gml:surfaceMember xlink:href="#PolyID58914_1307_607941_114014"/>
              <gml:surfaceMember xlink:href="#PolyID58915_693_321944_318712"/>
              <gml:surfaceMember xlink:href="#PolyID58916_1618_190498_353340"/>
              <gml:surfaceMember xlink:href="#PolyID58917_257_573785_278141"/>
              <gml:surfaceMember xlink:href="#PolyID45488_1878_623744_29993"/>
              <gml:surfaceMember xlink:href="#PolyID45489_1241_160210_79540"/>
              <gml:surfaceMember xlink:href="#PolyID45490_980_523938_205257"/>
              <gml:surfaceMember xlink:href="#PolyID45491_552_178616_406087"/>
              <gml:surfaceMember xlink:href="#PolyID58918_1666_508104_106792"/>
              <gml:surfaceMember xlink:href="#PolyID58919_293_365452_56524"/>
              <gml:surfaceMember xlink:href="#PolyID45494_1549_894355_77993"/>
              <gml:surfaceMember xlink:href="#PolyID58823_570_138008_107322"/>
              <gml:surfaceMember xlink:href="#PolyID58824_439_290766_393776"/>
              <gml:surfaceMember xlink:href="#PolyID58825_1589_638409_186400"/>
              <gml:surfaceMember xlink:href="#PolyID58826_766_578922_7381"/>
              <gml:surfaceMember xlink:href="#PolyID58827_1782_330817_188911"/>
              <gml:surfaceMember xlink:href="#PolyID58828_1522_308899_25855"/>
              <gml:surfaceMember xlink:href="#PolyID58829_953_361344_310520"/>
              <gml:surfaceMember xlink:href="#PolyID58830_12_172372_362873"/>
              <gml:surfaceMember xlink:href="#PolyID58831_1162_492249_346547"/>
              <gml:surfaceMember xlink:href="#PolyID58832_649_212520_225345"/>
              <gml:surfaceMember xlink:href="#PolyID58833_1455_377730_279429"/>
              <gml:surfaceMember xlink:href="#PolyID58834_336_613769_96500"/>
              <gml:surfaceMember xlink:href="#PolyID58835_1650_623307_361645"/>
              <gml:surfaceMember xlink:href="#PolyID58836_1456_865943_237319"/>
              <gml:surfaceMember xlink:href="#PolyID58837_1583_77116_269612"/>
              <gml:surfaceMember xlink:href="#PolyID58838_707_749636_174617"/>
              <gml:surfaceMember xlink:href="#PolyID58839_1996_96543_56894"/>
              <gml:surfaceMember xlink:href="#PolyID58840_1096_855539_244285"/>
              <gml:surfaceMember xlink:href="#PolyID58841_392_624392_8151"/>
              <gml:surfaceMember xlink:href="#PolyID58842_1595_491700_282570"/>
              <gml:surfaceMember xlink:href="#PolyID58843_1862_478243_373176"/>
              <gml:surfaceMember xlink:href="#PolyID58844_293_862667_200176"/>
              <gml:surfaceMember xlink:href="#PolyID58845_1505_99391_314552"/>
              <gml:surfaceMember xlink:href="#PolyID58846_1607_419091_114346"/>
              <gml:surfaceMember xlink:href="#PolyID58847_90_140038_409167"/>
              <gml:surfaceMember xlink:href="#PolyID58848_1643_368347_161032"/>
              <gml:surfaceMember xlink:href="#PolyID58849_1037_422449_337587"/>
              <gml:surfaceMember xlink:href="#PolyID58850_1035_615015_167623"/>
              <gml:surfaceMember xlink:href="#PolyID58851_1589_798265_173568"/>
              <gml:surfaceMember xlink:href="#PolyID58852_1403_247001_10369"/>
              <gml:surfaceMember xlink:href="#PolyID58853_1615_480753_1407"/>
              <gml:surfaceMember xlink:href="#PolyID58854_1444_67764_179010"/>
              <gml:surfaceMember xlink:href="#PolyID58855_566_600693_272738"/>
              <gml:surfaceMember xlink:href="#PolyID58856_812_63520_36025"/>
              <gml:surfaceMember xlink:href="#PolyID58857_553_455273_290230"/>
              <gml:surfaceMember xlink:href="#PolyID58858_311_115612_297940"/>
              <gml:surfaceMember xlink:href="#PolyID58859_1105_560490_423671"/>
              <gml:surfaceMember xlink:href="#PolyID58860_1517_658785_414270"/>
              <gml:surfaceMember xlink:href="#PolyID58861_396_754114_102807"/>
              <gml:surfaceMember xlink:href="#PolyID58862_1508_661324_353344"/>
              <gml:surfaceMember xlink:href="#PolyID58863_1761_209205_363750"/>
              <gml:surfaceMember xlink:href="#PolyID58864_266_525477_126998"/>
              <gml:surfaceMember xlink:href="#PolyID58865_526_15168_228546"/>
              <gml:surfaceMember xlink:href="#PolyID58866_156_725100_178245"/>
              <gml:surfaceMember xlink:href="#PolyID58867_1367_497472_296633"/>
              <gml:surfaceMember xlink:href="#PolyID58868_724_854947_375866"/>
              <gml:surfaceMember xlink:href="#PolyID58869_119_43728_205515"/>
              <gml:surfaceMember xlink:href="#PolyID58870_1860_438101_33103"/>
              <gml:surfaceMember xlink:href="#PolyID58871_329_330460_187159"/>
              <gml:surfaceMember xlink:href="#PolyID58872_1035_165516_336492"/>
              <gml:surfaceMember xlink:href="#PolyID58873_1558_279514_43072"/>
              <gml:surfaceMember xlink:href="#PolyID58874_707_866165_220822"/>
              <gml:surfaceMember xlink:href="#PolyID58875_248_685565_291683"/>
              <gml:surfaceMember xlink:href="#PolyID58876_1646_212881_351851"/>
              <gml:surfaceMember xlink:href="#PolyID58877_462_742322_212929"/>
              <gml:surfaceMember xlink:href="#PolyID58878_1780_17352_191996"/>
              <gml:surfaceMember xlink:href="#PolyID58879_886_751312_428816"/>
              <gml:surfaceMember xlink:href="#PolyID58880_589_43766_423768"/>
              <gml:surfaceMember xlink:href="#PolyID58881_71_863606_40602"/>
              <gml:surfaceMember xlink:href="#PolyID58882_1691_230441_40603"/>
              <gml:surfaceMember xlink:href="#PolyID58883_1037_687764_121563"/>
              <gml:surfaceMember xlink:href="#PolyID58884_1627_899224_389116"/>
              <gml:surfaceMember xlink:href="#PolyID58885_876_846116_316992"/>
              <gml:surfaceMember xlink:href="#PolyID58886_933_860878_127263"/>
              <gml:surfaceMember xlink:href="#PolyID58887_1993_113857_311904"/>
              <gml:surfaceMember xlink:href="#PolyID58888_351_262296_414185"/>
              <gml:surfaceMember xlink:href="#PolyID58889_1267_437476_45575"/>
              <gml:surfaceMember xlink:href="#PolyID58890_1586_699919_109999"/>
              <gml:surfaceMember xlink:href="#PolyID58891_1570_83267_355718"/>
              <gml:surfaceMember xlink:href="#PolyID58892_1716_836988_157786"/>
              <gml:surfaceMember xlink:href="#PolyID58893_523_674478_365336"/>
              <gml:surfaceMember xlink:href="#PolyID58894_1798_71247_374813"/>
              <gml:surfaceMember xlink:href="#PolyID58895_177_729072_1359"/>
              <gml:surfaceMember xlink:href="#PolyID58896_1460_485806_164686"/>
              <gml:surfaceMember xlink:href="#PolyID58897_1185_441649_380580"/>
              <gml:surfaceMember xlink:href="#PolyID58898_158_629934_409515"/>
              <gml:surfaceMember xlink:href="#PolyID58899_1460_365559_91271"/>
              <gml:surfaceMember xlink:href="#PolyID58900_306_139976_395379"/>
              <gml:surfaceMember xlink:href="#PolyID58901_953_311220_138631"/>
              <gml:surfaceMember xlink:href="#PolyID58902_1537_85954_306182"/>
              <gml:surfaceMember xlink:href="#PolyID58903_1839_642244_370862"/>
              <gml:surfaceMember xlink:href="#PolyID58906_886_364949_26381"/>
              <gml:surfaceMember xlink:href="#PolyID58905_883_830507_79018"/>
              <gml:surfaceMember xlink:href="#PolyID58904_926_485070_129763"/>
              <gml:surfaceMember xlink:href="#PolyID58718_509_420914_99840"/>
              <gml:surfaceMember xlink:href="#PolyID58719_1668_843061_5809"/>
              <gml:surfaceMember xlink:href="#PolyID58720_254_451830_156398"/>
              <gml:surfaceMember xlink:href="#PolyID58721_1706_427521_368985"/>
              <gml:surfaceMember xlink:href="#PolyID58722_224_323902_252423"/>
              <gml:surfaceMember xlink:href="#PolyID58723_439_431781_373725"/>
              <gml:surfaceMember xlink:href="#PolyID58724_1967_868315_208008"/>
              <gml:surfaceMember xlink:href="#PolyID58725_1421_209484_393490"/>
              <gml:surfaceMember xlink:href="#PolyID58726_671_554234_212436"/>
              <gml:surfaceMember xlink:href="#PolyID58727_657_504736_78856"/>
              <gml:surfaceMember xlink:href="#PolyID58728_577_102541_299483"/>
              <gml:surfaceMember xlink:href="#PolyID58729_1200_447052_104531"/>
              <gml:surfaceMember xlink:href="#PolyID58730_1683_860946_68139"/>
              <gml:surfaceMember xlink:href="#PolyID58731_1219_480209_127236"/>
              <gml:surfaceMember xlink:href="#PolyID58732_300_736728_134369"/>
              <gml:surfaceMember xlink:href="#PolyID58733_1677_827795_100700"/>
              <gml:surfaceMember xlink:href="#PolyID58734_443_173915_418248"/>
              <gml:surfaceMember xlink:href="#PolyID58735_61_408337_179410"/>
              <gml:surfaceMember xlink:href="#PolyID58736_1099_849209_286672"/>
              <gml:surfaceMember xlink:href="#PolyID58737_1064_836277_325527"/>
              <gml:surfaceMember xlink:href="#PolyID58738_1858_410319_138382"/>
              <gml:surfaceMember xlink:href="#PolyID58739_93_139462_125106"/>
              <gml:surfaceMember xlink:href="#PolyID58740_597_260514_271204"/>
              <gml:surfaceMember xlink:href="#PolyID58741_292_29758_205873"/>
              <gml:surfaceMember xlink:href="#PolyID58742_1305_101478_70299"/>
              <gml:surfaceMember xlink:href="#PolyID58743_353_267552_336288"/>
              <gml:surfaceMember xlink:href="#PolyID58744_151_805227_372589"/>
              <gml:surfaceMember xlink:href="#PolyID58745_1956_497265_192895"/>
              <gml:surfaceMember xlink:href="#PolyID58746_346_607928_425761"/>
              <gml:surfaceMember xlink:href="#PolyID58747_1503_480064_356412"/>
              <gml:surfaceMember xlink:href="#PolyID58748_1646_113420_81152"/>
              <gml:surfaceMember xlink:href="#PolyID58749_1825_295579_315972"/>
              <gml:surfaceMember xlink:href="#PolyID58750_564_629766_418777"/>
              <gml:surfaceMember xlink:href="#PolyID58751_151_118600_295696"/>
              <gml:surfaceMember xlink:href="#PolyID58752_858_826323_376037"/>
              <gml:surfaceMember xlink:href="#PolyID58753_1323_788001_38056"/>
              <gml:surfaceMember xlink:href="#PolyID58754_847_898397_204895"/>
              <gml:surfaceMember xlink:href="#PolyID58755_855_543018_273807"/>
              <gml:surfaceMember xlink:href="#PolyID58756_728_727477_129311"/>
              <gml:surfaceMember xlink:href="#PolyID58757_1190_133733_205599"/>
              <gml:surfaceMember xlink:href="#PolyID58758_473_866699_76298"/>
              <gml:surfaceMember xlink:href="#PolyID58759_932_219075_423932"/>
              <gml:surfaceMember xlink:href="#PolyID58760_1123_610859_324850"/>
              <gml:surfaceMember xlink:href="#PolyID58761_360_748179_284772"/>
              <gml:surfaceMember xlink:href="#PolyID58762_1767_354637_153477"/>
              <gml:surfaceMember xlink:href="#PolyID58763_197_610103_163787"/>
              <gml:surfaceMember xlink:href="#PolyID58764_11_591251_67040"/>
              <gml:surfaceMember xlink:href="#PolyID58765_1620_317404_230187"/>
              <gml:surfaceMember xlink:href="#PolyID58766_1041_669385_130795"/>
              <gml:surfaceMember xlink:href="#PolyID58767_309_319898_242176"/>
              <gml:surfaceMember xlink:href="#PolyID58768_1040_256187_326219"/>
              <gml:surfaceMember xlink:href="#PolyID58769_1881_454925_167376"/>
              <gml:surfaceMember xlink:href="#PolyID58770_1784_618181_39032"/>
              <gml:surfaceMember xlink:href="#PolyID58771_1187_701223_394355"/>
              <gml:surfaceMember xlink:href="#PolyID58772_547_637713_390862"/>
              <gml:surfaceMember xlink:href="#PolyID58773_793_593960_380050"/>
              <gml:surfaceMember xlink:href="#PolyID58774_793_865544_188787"/>
              <gml:surfaceMember xlink:href="#PolyID58775_282_175384_345012"/>
              <gml:surfaceMember xlink:href="#PolyID58776_1552_664428_319210"/>
              <gml:surfaceMember xlink:href="#PolyID58777_1359_666261_417799"/>
              <gml:surfaceMember xlink:href="#PolyID58778_1096_548803_126046"/>
              <gml:surfaceMember xlink:href="#PolyID58779_1428_163641_401174"/>
              <gml:surfaceMember xlink:href="#PolyID58780_568_797601_421115"/>
              <gml:surfaceMember xlink:href="#PolyID58781_1599_837624_120564"/>
              <gml:surfaceMember xlink:href="#PolyID58782_1554_391576_397213"/>
              <gml:surfaceMember xlink:href="#PolyID58783_1364_412095_196243"/>
              <gml:surfaceMember xlink:href="#PolyID58784_1851_450835_195960"/>
              <gml:surfaceMember xlink:href="#PolyID58785_571_484072_399504"/>
              <gml:surfaceMember xlink:href="#PolyID58786_416_647588_414858"/>
              <gml:surfaceMember xlink:href="#PolyID58787_678_758646_31866"/>
              <gml:surfaceMember xlink:href="#PolyID58788_756_104461_254505"/>
              <gml:surfaceMember xlink:href="#PolyID58789_846_196612_169762"/>
              <gml:surfaceMember xlink:href="#PolyID58790_1248_92472_252525"/>
              <gml:surfaceMember xlink:href="#PolyID58791_120_287257_174378"/>
              <gml:surfaceMember xlink:href="#PolyID58792_59_583087_214481"/>
              <gml:surfaceMember xlink:href="#PolyID58793_416_393222_104842"/>
              <gml:surfaceMember xlink:href="#PolyID58794_397_290407_425276"/>
              <gml:surfaceMember xlink:href="#PolyID58795_1164_574220_320141"/>
              <gml:surfaceMember xlink:href="#PolyID58796_1723_375485_410870"/>
              <gml:surfaceMember xlink:href="#PolyID58797_1512_530222_357889"/>
              <gml:surfaceMember xlink:href="#PolyID58798_713_434939_29079"/>
              <gml:surfaceMember xlink:href="#PolyID58799_1369_443926_175858"/>
              <gml:surfaceMember xlink:href="#PolyID58800_1903_739625_389368"/>
              <gml:surfaceMember xlink:href="#PolyID58801_882_806674_392883"/>
              <gml:surfaceMember xlink:href="#PolyID58802_1543_379123_11561"/>
              <gml:surfaceMember xlink:href="#PolyID58803_371_698036_77126"/>
              <gml:surfaceMember xlink:href="#PolyID58804_647_880710_163324"/>
              <gml:surfaceMember xlink:href="#PolyID58805_1881_773628_351228"/>
              <gml:surfaceMember xlink:href="#PolyID58806_328_642559_374120"/>
              <gml:surfaceMember xlink:href="#PolyID58807_717_125437_84247"/>
              <gml:surfaceMember xlink:href="#PolyID58808_349_692294_125678"/>
              <gml:surfaceMember xlink:href="#PolyID58809_472_527501_416856"/>
              <gml:surfaceMember xlink:href="#PolyID58810_1807_553097_148846"/>
              <gml:surfaceMember xlink:href="#PolyID58811_1622_73903_56220"/>
              <gml:surfaceMember xlink:href="#PolyID58812_795_350114_216214"/>
              <gml:surfaceMember xlink:href="#PolyID58813_1099_461650_222485"/>
              <gml:surfaceMember xlink:href="#PolyID58814_1459_649731_52436"/>
              <gml:surfaceMember xlink:href="#PolyID58815_691_101880_418020"/>
              <gml:surfaceMember xlink:href="#PolyID58816_858_312337_86583"/>
              <gml:surfaceMember xlink:href="#PolyID58817_701_101369_361161"/>
              <gml:surfaceMember xlink:href="#PolyID58818_1640_464682_59215"/>
              <gml:surfaceMember xlink:href="#PolyID58819_65_364244_211813"/>
              <gml:surfaceMember xlink:href="#PolyID58820_1568_227087_210505"/>
              <gml:surfaceMember xlink:href="#PolyID58821_1939_612838_272028"/>
              <gml:surfaceMember xlink:href="#PolyID58822_551_84845_215911"/>
            </gml:Shell>
          </gml:exterior>
        </gml:Solid>
      </lod3Solid>
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