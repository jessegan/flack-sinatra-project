# CREATE USERS 
user1 = User.create(email: "test@test.com",password:"test",name:"Joe Smith")
user2 = User.create(email: "test2@test.com",password:"test",name:"Jane Wang")
user3 = User.create(email: "test3@test.com",password:"test",name:"Steven Rogers")
user4 = User.create(email: "test4@test.com",password:"test",name:"Miley Cyrus")
user5 = User.create(email: "test5@test.com",password:"test",name:"Tim Tebow")

# CREATE GROUPS
group1 = Group.create(name:"test1",display_name:"Group 1")
group2 = Group.create(name:"test2",display_name:"Group 2")
group3 = Group.create(name:"test3",display_name:"Group 3")

# ADD USERS TO GROUPS
group1.users << user1
group1.users << user2
group1.users << user3
group1.users << user4
group1.users << user5

group2.users << user1
group2.users << user2
group2.users << user4
group2.users << user5

group3.users << user1
group3.users << user5

# CREATE CHANNELS
channel1 = Channel.create(name:"general", group:group1)
channel2 = Channel.create(name:"events", group:group1)
channel3 = Channel.create(name:"music", group:group1)

channel4 = Channel.create(name:"general", group:group2)
channel5 = Channel.create(name:"events", group:group2)
channel6 = Channel.create(name:"music", group:group2)

channel7 = Channel.create(name:"general", group:group3)
channel8 = Channel.create(name:"events", group:group3)
channel9 = Channel.create(name:"music", group:group3)

# CREATE MESSAGES
Message.create(channel:channel1,user: user1,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel1,user: user2,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel1,user: user1,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel1,user: user3,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel1,user: user4,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel1,user: user2,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel1,user: user5,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel1,user: user5,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")

Message.create(channel:channel2,user: user5,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel2,user: user3,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel2,user: user4,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel2,user: user4,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel2,user: user1,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")

Message.create(channel:channel4,user: user1,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel4,user: user2,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel4,user: user4,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel4,user: user5,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel4,user: user5,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")

Message.create(channel:channel5,user: user2,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel5,user: user4,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")

Message.create(channel:channel7,user: user1,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel7,user: user1,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel7,user: user5,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel7,user: user1,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel7,user: user5,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")

Message.create(channel:channel8,user: user1,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel8,user: user5,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel8,user: user5,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel8,user: user5,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")
Message.create(channel:channel8,user: user1,contents:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sem placerat, pretium metus sed.")