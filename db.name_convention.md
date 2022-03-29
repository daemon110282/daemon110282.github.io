# DB Name Convention

общие:
https://www.sqlstyle.guide/ru/
abp:
https://docs.abp.io/en/abp/latest/Best-Practices/Entity-Framework-Core-Integration
ef:
https://www.learnentityframeworkcore.com/conventions

наверняка ты гуглил по наименованию, прежде чем попросить пруф. Но обозначу, что ты гуглил не указывая котекст .net. Но мы то пишет в .net + ef + abp и понятия "навигационых свойств" и соттвествующих dbset - ов  упрощают нам разработку именно в Plural и возможность в модели прописывать связи коллекций, одиночных сущностей и не путаться в коде. И plural наименования - это дефолтное поведение в EF.
