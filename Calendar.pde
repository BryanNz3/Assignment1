class Calendar
{
   float x;
   float y;
   int Event_ID;
   String Month;
   String Event_Date;
   String Event_Name;
   String Day;
   String Type;
   
   Calendar(String line)
   {
     String[] parts = line.split("\t");
     x = Float.parseFloat(parts[0]);
     y = Float.parseFloat(parts[1]);
     Event_ID = Integer.parseInt(parts[2]);
     Month = parts[3];
     Event_Date = parts[4];
     Event_Name = parts[5];
     Day = parts[6];
     Type = parts[7];
   }
  
}