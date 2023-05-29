module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'Free Theme'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def default_meta_tags
    {
      site: 'Free Theme',
      title: 'Free Theme',
      reverse: false,
      charset: 'utf-8',
      description: '外出先や旅先での空いた時間を有意義な時間に変える、出題型のお題達成サービスです',
      keywords: '外出先, 旅先, 空いてる時間, 暇な時間',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@FreeTheme461551',
        image: image_url('ogp.png')
      }
    }
  end
end
