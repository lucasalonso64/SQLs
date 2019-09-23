/*
Relatório para listar todos os cadastros ativos da fac
*/
select Distinct 
sra.RA_FILIAL, 
sra.RA_MAT Matricula, 
sra.RA_NOME Nome, 
CTT.CTT_CUSTO
,(select top 1 RA_NOME from vw_SRA sra1 where sra1.RA_MAT = sra.RA_MATRES and sra1.D_E_L_E_T_ <> '*') as Responsavel,
sz.Z2_SUBC Subconta
 from vw_SRA sra
INNER JOIN  DADOSADV.dbo.SZ2010 sz on (sra.RA_FIPSUBC = sz.Z2_SUBC )
INNER JOIN DADOSADV.dbo.CTT010 CTT ON (SZ.Z2_SETOR = CTT.CTT_CUSTO )
INNER JOIN fipepc fip on (sra.RA_FIPSUBC = fip.FIP_SUBC)
 where sra.RA_DEMISSA = '' 
Order by RA_FILIAL asc
