 Table tableHum, tableTemp, tablePres, tableWD, tableWS, tableSolar;
 Table MineTable, MineTableMin;
 IntList idList, idListMin;
 String date, date12;
 char dateChar[];
 float min, max;

void setup() {
  size(400, 400);
  tableSolar = loadTable("solar radiation.csv");
  tablePres = loadTable("barometric pressure.csv");
  tableHum = loadTable("humidity.csv");
  tableTemp = loadTable("temperature.csv");
  tableWD = loadTable("wind direction in degrees.csv");
  tableWS = loadTable("wind speed.csv");
  
  /*NAJWYZSZA WARTOSC*/
  idList = new IntList();
  max = 0;
  for(TableRow rows1 : tableSolar.rows()){
   if(rows1.getFloat(4) > 1121) {
    idList.append(rows1.getInt(0)-1);
    if(rows1.getFloat(4) > max) {
     max = rows1.getFloat(4);
    }
   }
  }
  println("Rozmiar Max: " + idList.size());
  
  /*NAJMNIEJSZA WARTOŚĆ*/
  idListMin = new IntList();
  min = 1000;
  for(TableRow rows : tableSolar.rows()){
     date = rows.getString(3);
     if(date == null) {
      println("Null " + rows.getInt(0));
     } else {
      date12 = date.substring(0,3);
      if(date12.equals("12:")){
        if(rows.getFloat(4) >= 200 && rows.getFloat(4) <= 322) {
         idListMin.append(rows.getInt(0));
          if(rows.getFloat(4) < min) {
           min = rows.getFloat(4);
          }
        }
      }
     }
  }
  println("Rozmiar Min: " + idListMin.size());
  /*
  for(int i = 0; i < idList.size(); i++){
    println("ID: " + idList.get(i));
    println("Wartość: " + tableSolar.getFloat(idList.get(i), 4) + " Pres: " 
      + tablePres.getFloat(idList.get(i), 4) + " Hum: " + tableHum.getInt(idList.get(i), 4) + 
      " Temp: " + tableTemp.getInt(idList.get(i), 4) + " WD: " +
      tableWD.getFloat(idList.get(i),4) + " WS: " + tableWS.getFloat(idList.get(i), 4));
  }*/
  /*
  for(int i = 0; i < idListMin.size(); i++){
    println("ID: " + idListMin.get(i));
    println("Wartość: " + tableSolar.getFloat(idListMin.get(i), 4) + " Pres: " 
      + tablePres.getFloat(idListMin.get(i), 4) + " Hum: " + 
      tableHum.getInt(idListMin.get(i), 4) + 
      " Temp: " + tableTemp.getInt(idListMin.get(i), 4) + " WD: " +
      tableWD.getFloat(idListMin.get(i),4) + " WS: " + tableWS.getFloat(idListMin.get(i), 4)
      + " Czas: " + tableSolar.getString(idListMin.get(i), 3));
  }*/
  println("Min: " + min);
  println("Max: " + max);
  
  MineTable = new Table();
  MineTable.addColumn("id");
  MineTable.addColumn("solar");
  MineTable.addColumn("presure");
  MineTable.addColumn("humidity");
  MineTable.addColumn("temperature");
  MineTable.addColumn("wind direction");
  MineTable.addColumn("wind speed");
  MineTable.addColumn("id dane");
  
  for(int k = 0; k < idList.size(); k++) {
    TableRow newRow = MineTable.addRow();
    newRow.setInt("id", MineTable.getRowCount());
    newRow.setFloat("solar", tableSolar.getFloat(idList.get(k), 4));
    newRow.setFloat("presure", tablePres.getFloat(idList.get(k), 4));
    newRow.setInt("humidity", tableHum.getInt(idList.get(k), 4));
    newRow.setInt("temperature", tableTemp.getInt(idList.get(k), 4));
    newRow.setFloat("wind direction", tableWD.getFloat(idList.get(k),4));
    newRow.setFloat("wind speed", tableWS.getFloat(idList.get(k), 4));
    newRow.setInt("id dane", tableSolar.getInt(idList.get(k), 0));
  }
  saveTable(MineTable, "max.csv");
  
  MineTableMin = new Table();
  MineTableMin.addColumn("id");
  MineTableMin.addColumn("solar");
  MineTableMin.addColumn("presure");
  MineTableMin.addColumn("humidity");
  MineTableMin.addColumn("temperature");
  MineTableMin.addColumn("wind direction");
  MineTableMin.addColumn("wind speed");
  MineTableMin.addColumn("id dane");
  
  for(int l = 0; l < idListMin.size(); l++) {
    TableRow newRow1 = MineTableMin.addRow();
    newRow1.setInt("id", MineTableMin.getRowCount());
    newRow1.setFloat("solar", tableSolar.getFloat(idListMin.get(l), 4));
    newRow1.setFloat("presure", tablePres.getFloat(idListMin.get(l), 4));
    newRow1.setInt("humidity", tableHum.getInt(idListMin.get(l), 4));
    newRow1.setInt("temperature", tableTemp.getInt(idListMin.get(l), 4));
    newRow1.setFloat("wind direction", tableWD.getFloat(idListMin.get(l),4));
    newRow1.setFloat("wind speed", tableWS.getFloat(idListMin.get(l), 4));
    newRow1.setInt("id dane", tableSolar.getInt(idListMin.get(l), 0));
  }
  saveTable(MineTableMin, "min.csv");
  
  
  
}

void draw() {
  
}