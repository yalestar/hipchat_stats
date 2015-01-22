library(rmongodb)
mc <- mongo.create(host="localhost" , db="hipchat")
mongo.is.connected(mc)
db <- "hipchat"
coll <- "hipchat.nonsense"
p1 <- mongo.bson.from.JSON('{"$group" : {
  "_id" : { "month": { "$month": "$date" }, "day": { "$dayOfMonth": "$date" }, 
  "year": { "$year": "$date" } }, "count": { "$sum": 1 } }}')
cmds <- list(p1)
bson <- mongo.aggregation(mc, coll, cmds)