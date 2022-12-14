class TipQueries {
  static String fetchTips({required int page, required int perPage}) {
    return '''
   {
	getMyTips(page: $page, perPage: $perPage) {
		paginationInfo{
			count
			from
			items
			page
			pageIn
			pageNext
			pageLast
			pages
			prev
			to
		}
		tips{
			id
			description
			imageUrl
			awarenessScore
			category
			publishDate
			status
			title
			tipQuestions{
				id
				awarenessScore
				question
				questionOrder
				questionType
				tipQuestionAnswers{
					answer
					id
					imageUrl
				}
			}
			quizResultContent{
				boldDescription
				category
				colorCode
				description
				id
				imageUrl
				personalityType
				title
			}
			company{
				id
				companyCode
				name
				imageUrl
			}
		}
	}
}
''';
  }

  static String fetchTipById({required String tipId}) {
    return '''
{
	getTipGeneral(id: "$tipId") {
			id
			description
			imageUrl
			awarenessScore
			category
			publishDate
			status
			title
			userFeedback
			tipQuestions{
				id
				awarenessScore
				question
				questionOrder
				questionType
				tipQuestionAnswers{
					answer
					id
					imageUrl
				}
			}
			quizResultContent{
				boldDescription
				category
				colorCode
				description
				id
				imageUrl
				personalityType
				title
			}
			company{
				id
				companyCode
				name
				imageUrl
			}
	}
}
''';
  }
}
