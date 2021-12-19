with duplicate_tb as (
    select email, count(email)
    from person
    group by email
    having count(email) >= 2
)

select email from duplicate_tb
