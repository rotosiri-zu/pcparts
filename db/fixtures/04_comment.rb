Comment.seed(:id,
             {
               id: 1,
               post_id: 1,
               user_id: 1,
               title: 'テスト',
               rate: [1, 2, 3, 4, 5].sample,
               content: 'テスト'
             },
             {
               id: 2,
               post_id: 2,
               user_id: 1,
               title: 'テスト',
               rate: [1, 2, 3, 4, 5].sample,
               content: 'テスト'
             },
             {
               id: 3,
               post_id: 3,
               user_id: 1,
               title: 'テスト',
               rate: [1, 2, 3, 4, 5].sample,
               content: 'テスト'
             },
             {
               id: 4,
               post_id: 4,
               user_id: 1,
               title: 'テスト',
               rate: [1, 2, 3, 4, 5].sample,
               content: 'テスト'
             })
