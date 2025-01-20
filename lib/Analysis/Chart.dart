import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatefulWidget {

  final List<FlSpot> spots;
  final DateTime data;
  const Chart({super.key, required this.spots, required this.data});


  @override
  State<Chart> createState() => _ChartState();
}

// grafico q eu peguei da net, provavelmente não funciona e back não ta subindo, verificar isso

class _ChartState extends State<Chart> {


  @override
  Widget build(BuildContext context) {
    DateTime date = widget.data;
    double minY = widget.spots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b);
    double maxY = widget.spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
    double minX = widget.spots.map((spot) => spot.x).reduce((a, b) => a < b ? a : b);
    double maxX = widget.spots.map((spot) => spot.x).reduce((a, b) => a > b ? a : b);
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);

    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (linebarspot) {
                  return Colors.white;
                },
                getTooltipItems: (linebarspot) {
                  return [LineTooltipItem("${formattedDate}, ${linebarspot.single.y.toInt()} Kg", TextStyle(color: Colors.purple))];
                }

            )
        ),
        backgroundColor: Colors.black26,
        minX: minX,
        maxX: maxX + 10,
        minY: minY - 5,
        maxY: maxY + 20,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}', // Adiciona um símbolo aos valores
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
             int index = value.toInt();
                String formattedDate = DateFormat('dd/MM').format(date);
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    formattedDate,
                      style: const TextStyle(fontSize: 10, color: Colors.black),
                  ),
          );}
          )),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), // Sem título no topo
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), // Sem título na direita
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
              curveSmoothness: 0.3,
              barWidth: 4,
              isCurved: true,
              color: Colors.purple,
              spots: widget.spots
          )
        ], // Sem dados de linhas
      ),
    );
  }
}


