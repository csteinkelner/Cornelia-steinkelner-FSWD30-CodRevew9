-- select all rents wher the driver id was 1
SELECT * FROM `rent` WHERE fk_driver_id = 1

-- select all additional charges whith the reason of "damage"(reason id 2)
SELECT * FROM `additional_charges` WHERE fk_reason_id = 2

-- select all drivers of the age between 18 and 40
SELECT * FROM `driver` WHERE `age` BETWEEN 18 AND 40;

-- select all cars with the type 1
SELECT * FROM `car` WHERE fk_car_type_id = 1;

-- count how manny cars there are
SELECT COUNT(*) FROM `car`;

-- show all cars which are rented
SELECT car_id, rent_id
FROM car
INNER JOIN rent ON car.car_id = rent.rent_id;

