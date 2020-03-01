SELECT MP.[Item]
      ,MP.[Buy Price]
      ,MP.[Sell Price]
      ,MP.[Gross Margin]
      --,MP.[Buy Fees]
      --,MP.[Sell Fees]
      --,MP.[Sell Taxes]
      ,MP.[Net Profit]
      ,MP.[R#O#I] * 100 as ROI
      ,MP.[24-Hour Volume]
      --,MP.[14-Day Volume]
      --,MP.[30-Day Volume]

  FROM [EveOnline].[dbo].[EveOnline_MarketPrices] MP

  Inner Join [EveOnline].[dbo].[invTypes] IT
  on MP.Item = IT.TYPENAME

Inner Join invGroups IG
on IG.groupID = IT.GROUPID

Where
IG.categoryID = 6  --Ships
and
Hub = 'Amarr'
--Hub = 'Jita'
--Hub = 'Rens'

Order by [Net Profit] * 24-[24-Hour Volume] Desc