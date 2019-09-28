create DATABASE friends_db;
use friends_db;
/*table 1 with all questions*/
create table question
(
    q_id int not null
    auto_increment,
    q varchar
    (255),
    PRIMARY key
    (q_id)
);

    --   your friends table should have a name and photo column
    --     id, name, picture_link
    create table friends
    (
        f_id int not null
        auto_increment,
    f_name VARCHAR
        (255),
    picture_link VARCHAR
        (255),
    PRIMARY key
        (f_id)
);
        --   your scores table should have 
        --     id, question_id, friend_id, score
        CREATE TABLE scores
        (
            f_id INT NOT NULL,
            q_id INT NOT NULL,
            score INT NOT NULL,
            FOREIGN KEY (f_id) REFERENCES friends(f_id),
            FOREIGN KEY (q_id) REFERENCES question(q_id)
        );

        INSERT INTO friends
            (name, picture_link)
        VALUES
            ("Miranda Hobbs", "https:
//vignette.wikia.nocookie.net/sexandthecity/images/b/bf/Miranda2.jpg/revision/latest?cb=20151031113334"),
            ("Carry Bradshaw", "https:
//pixel.nymag.com/imgs/daily/vulture/2019/01/22/22-carrie-bradshaw-stella.w1200.h1200.jpg"),
            ("Samantha Jones", "http:
//images4.fanpop.com/image/photos/15800000/SATC-2-samantha-jones-15847995-425-535.jpg"),
            ("Keanu Reeves", "https:
//media.gq.com/photos/5ca372ddf660a04ba4e84f1e/master/w_4000,h_3000,c_limit/keanu-reeves-gq-cover-may-2019-04.jpg"),
            ("Joker Joker", "https:
//encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR5sDjrPrM453VIBSULKqMc5IB11Vp9hx1NJiMvxlvQYUZFyAGw"),
            ("Jared Leto", "https:
//thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2Fb7ed368ea22b4dd6954773e64a79cafc%2F960x0.jpg%3Ffit%3Dscale"),
            ("Elon Musk", "https:
//image.cnbcfm.com/api/v1/image/104994086-RTX4RL3Z.jpg?v=1534179983&w=1400&h=950");



