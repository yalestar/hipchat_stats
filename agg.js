db.android.aggregate(
   [
      {
        $group : {
           _id : { month: { $month: "$date" }, day: { $dayOfMonth: "$date" }, year: { $year: "$date" } },
           cnt: { $sum: 1 }
        },
      thedate: { first: $date }
      },
      { $project:
        { _id: 0,
          state: "$_id",
          cnt:  { name: "$cnt" }
        }
      }
   ]
)