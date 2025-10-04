import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class UzbMap extends StatefulWidget {
  const UzbMap({super.key});

  @override
  State<UzbMap> createState() => _UzbMapState();
}

class _UzbMapState extends State<UzbMap> {
  late MapShapeSource _mapSource;
  int _selectedIndex = 0;

  final List<_RegionData> _regions = [
    _RegionData('Toshkent', 0),
    _RegionData('Andijon', 1),
    _RegionData('Farg‘ona', 2),
    _RegionData('Namangan', 3),
    _RegionData('Buxoro', 4),
    _RegionData('Samarqand', 5),
    _RegionData('Xorazm', 6),
    _RegionData('Navoiy', 7),
    _RegionData('Surxondaryo', 8),
    _RegionData('Qashqadaryo', 9),
    _RegionData('Jizzax', 10),
    _RegionData('Sirdaryo', 11),
    _RegionData("Qoraqalpog‘iston", 12),
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
                context.read<AppBloc>().add(RegionStatisticsEvent(region: _regions[index].name));
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
