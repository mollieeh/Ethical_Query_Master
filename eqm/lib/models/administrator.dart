class Administrator 
{
  Administrator(
    {
      required this.headerText,
      required this.expandedText,
      this.isExpanded = true,
    });

    String headerText;
    String expandedText;
    bool isExpanded;

    static List<Administrator> getAdminList()
    {
      List<Administrator> adminList = [];

      adminList.add
      (
        Administrator
        (
          headerText: 'User Information', 
          expandedText: 'Username: \nPassword: \nEmail: '
        )
      );
      adminList.add
      (
        Administrator
        (
          headerText: 'View Queries', 
          expandedText: 'Stance: \nQuestion: \nResponse: '
        )
      );
      adminList.add
      (
        Administrator
        (
          headerText: 'Delete/Reset Account', 
          expandedText: 'Delete/Reset'
        )
      );

      return adminList;
    }
}

