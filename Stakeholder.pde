public class Stakeholder
{
  private int m_iCloseness;
  private int m_iInfluence;
  private String m_sName;
  private color m_cColor;
  
  //Constructor
  Stakeholder(int iCloseness, int iInfluence, String sName, color cColor)
  {
    m_iCloseness = iCloseness;
    m_iInfluence = iInfluence;
    m_sName = sName;
    m_cColor = cColor;
  }
  
  //Getters
  int getCloseness()
  {
    return m_iCloseness;
  }
  
  int getInfluence()
  {
    return m_iInfluence;
  }
  
  String getName()
  {
    return m_sName;
  }
  
  color getColor()
  {
    return m_cColor;
  }
  
  //Setters
  void setCloseness(int iCloseness)
  {
    m_iCloseness = iCloseness;
  }
  
  void setInfluence(int iInfluence)
  {
    m_iInfluence = iInfluence;
  }
  
  void setName(String sName)
  {
    m_sName = sName;
  }
  
  void setColor(color cColor)
  {
    m_cColor = cColor;
  }
}
