import 'package:apalive/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class UzbMap extends StatefulWidget {
  const UzbMap({super.key});

  @override
  State<UzbMap> createState() => _UzbMapState();
}

class _UzbMapState extends State<UzbMap> {
  late MapShapeSource _mapSource;
  int _selectedIndex = -1;

  final List<_RegionData> _regions = [
    _RegionData('Tashkent', 0),
    _RegionData('Andijon', 1),
    _RegionData('Ferghana', 2),
    _RegionData('Namangan', 3),
    _RegionData('Bukhoro', 4),
    _RegionData('Samarkand', 5),
    _RegionData('Khorezm', 6),
    _RegionData('Navoi', 7),
    _RegionData('Surkhandarya', 8),
    _RegionData('Kashkadarya', 9),
    _RegionData('Jizzakh', 10),
    _RegionData('Sirdaryo', 11),
    _RegionData('Karakalpakstan', 12),
  ];

  @override
  void initState() {
    super.initState();
    _mapSource = MapShapeSource.asset(
      'assets/json/uzbekistan_map.json',
      shapeDataField: 'name',
      dataCount: _regions.length,
      primaryValueMapper: (int index) => _regions[index].name,
      shapeColorValueMapper: (int index) => _regions[index].index,
      shapeColorMappers: [
        MapColorMapper(from: 0, to: 12, color: Colors.grey.shade300),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Center(
        child: SfMaps(
          layers: [
            MapShapeLayer(
              source: _mapSource,
              selectedIndex: _selectedIndex,
              onSelectionChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectionSettings: MapSelectionSettings(
                color: blue,
                strokeColor: Colors.white,
                strokeWidth: 1,
              ),
              showDataLabels: false,
              legend: null,
              tooltipSettings: MapTooltipSettings(color: Colors.grey[700]),
              strokeColor: Colors.white,
              strokeWidth: 0.5,
              shapeTooltipBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _regions[index].name,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
              dataLabelSettings: MapDataLabelSettings(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegionData {
  final String name;
  final int index;
  _RegionData(this.name, this.index);
}
