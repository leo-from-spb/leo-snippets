create table Table_1 (Column_1 char(1), Column_2 char(2))
;

declare @sn nvarchar(30)
set @sn = schema_name()
execute sp_addextendedproperty N'MS_Description', N'The table''s description (just a simple comment to the table)', N'SCHEMA', @sn, N'TABLE', N'Table_1'
execute sp_addextendedproperty N'MS_Description', N'The first column', N'SCHEMA', @sn, N'TABLE', N'Table_1', N'COLUMN', N'Column_1'
execute sp_addextendedproperty N'MS_Description', N'The second column', N'SCHEMA', @sn, N'TABLE', N'Table_1', N'COLUMN', N'Column_2'
;

declare @sn nvarchar(30)
set @sn = schema_name()
execute sp_updateextendedproperty N'MS_Description', N'The COOL table''s description (just a very simple comment to the table)', N'SCHEMA', @sn, N'TABLE', N'Table_1'
;

declare @sn nvarchar(30)
set @sn = schema_name()
execute sp_updateextendedproperty N'MS_Description', N'Another column', N'SCHEMA', @sn, N'TABLE', N'Table_1', N'COLUMN', N'Column_2'
;
