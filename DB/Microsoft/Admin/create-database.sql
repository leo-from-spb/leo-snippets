use master

create database Rabbit
    on primary (name = 'Rabbit',
                filename = 'D:\DB\MSSQL\MSSQL14.MINISERVER\MSSQL\DATA\Rabbit.mdf',
                size = 8192kb,
                filegrowth = 65536kb)
    log on (name = 'Rabbit_log',
            filename = 'D:\DB\MSSQL\MSSQL14.MINISERVER\MSSQL\DATA\Rabbit_log.ldf',
            size = 8192kb,
            filegrowth = 65536kb)
go

alter database Rabbit set
    compatibility_level = 140,
    recovery simple
go

use Rabbit
