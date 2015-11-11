void setup()
{
  size(500,500);
  loadData();
}

ArrayList<Calendar> events = new ArrayList<Calendar>();

void loadData()
{
  String[] data = loadStrings("");
  for(int i = 0; i < data.length; i++)
  {
    Calendar instance = new Calendar(data[i]);
    events.add(instance);
  }
}