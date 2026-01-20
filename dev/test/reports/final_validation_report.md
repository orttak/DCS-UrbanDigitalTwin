| File | Type | Validator | Result | Details | Report |
|---|---|---|---|---|---|
| data\export\FZK_LOD2_from_db.city.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok |  |
| | | | | **Cmd:** `C:\Users\mert-\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\Scripts\cjio.exe D:\DCS\data\export\FZK_LOD2_from_db.city.json validate` | |
| data\export\FZK_LOD3_from_db.city.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok |  |
| | | | | **Cmd:** `C:\Users\mert-\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\Scripts\cjio.exe D:\DCS\data\export\FZK_LOD3_from_db.city.json validate` | |
| data\export\FZK_LOD2_from_blender_edited_to_LOD3.city.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | Fixed: Removed invalid 'BuildingPart' surface type (OuterCeilingSurface is valid) |  |
| | | | | **Cmd:** `cjio validate` | |
| data\export\FZK_LOD2_from_blender_not_edited.city.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok |  |
| | | | | **Cmd:** `C:\Users\mert-\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\Scripts\cjio.exe D:\DCS\data\export\FZK_LOD2_from_blender_not_edited.city.json validate` | |
| data\export\FZK_LOD3_from_blender_edited.city.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok |  |
| | | | | **Cmd:** `C:\Users\mert-\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\Scripts\cjio.exe D:\DCS\data\export\FZK_LOD3_from_blender_edited.city.json validate` | |
| data\export\FZK_LOD3_from_blender_not_edited.city.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok |  |
| | | | | **Cmd:** `C:\Users\mert-\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\Scripts\cjio.exe D:\DCS\data\export\FZK_LOD3_from_blender_not_edited.city.json validate` | |
| data\export\FZK_LOD2_export1.gml | CityGML | CityDoctorValidation | <span style="color: #1a7f37; font-weight: 600">PASS</span> | no errors reported | C:\Users\mert-\AppData\Local\Temp\citydoctor_09ci9mz1\FZK_LOD2_export1.citydoctor.xml |
| | | | | **Cmd:** `D:\DCS\CityDoctorValidation-3.18.1-win\runtime\bin\java.exe -classpath D:/DCS/CityDoctorValidation-3.18.1-win/app/*;D:/DCS/CityDoctorValidation-3.18.1-win/plugin/* de.hft.stuttgart.citydoctor2.CityDoctorValidation -in D:\DCS\data\export\FZK_LOD2_export1.gml -config D:\DCS\CityDoctorValidation-3.18.1-win\testConfigWithStreaming.yml -xmlReport C:\Users\mert-\AppData\Local\Temp\citydoctor_09ci9mz1\FZK_LOD2_export1.citydoctor.xml` | |
| data\export\FZK_LOD3_export_automated.gml | CityGML | CityDoctorValidation | <span style="color: #1a7f37; font-weight: 600">PASS</span> | no errors reported | C:\Users\mert-\AppData\Local\Temp\citydoctor_yhyu_g_i\FZK_LOD3_export_automated.citydoctor.xml |
| | | | | **Cmd:** `D:\DCS\CityDoctorValidation-3.18.1-win\runtime\bin\java.exe -classpath D:/DCS/CityDoctorValidation-3.18.1-win/app/*;D:/DCS/CityDoctorValidation-3.18.1-win/plugin/* de.hft.stuttgart.citydoctor2.CityDoctorValidation -in D:\DCS\data\export\FZK_LOD3_export_automated.gml -config D:\DCS\CityDoctorValidation-3.18.1-win\testConfigWithStreaming.yml -xmlReport C:\Users\mert-\AppData\Local\Temp\citydoctor_yhyu_g_i\FZK_LOD3_export_automated.citydoctor.xml` | |

## Workflow Validation Results
- **Database Update/Merge**: <span style="color: #d1242f; font-weight: 600">FAIL</span>. The citydb-tool causes semantic data loss (surfaces become null) when importing a file that overlaps with existing DB objects.
- **Workaround**: <span style="color: #1a7f37; font-weight: 600">SUCCESS</span>. Deleting the object from the DB first and then importing the new version preserves all data correctly.
