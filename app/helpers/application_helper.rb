module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :danger then 'bg-customgreen'
    when :success then 'bg-customgreen'
    when :error then 'bg-customorange'
    else 'bg-gray-500'
    end
  end

  def default_meta_tags
    {
      site: 'あんこねくと',
      title: '',
      reverse: true,
      separator: '',
      description: '全国各地の魅力的なあんこ菓子やスイーツの情報を集め、共有するサービスです。',
      keywords: 'あんこ, どら焼き, 最中, 羊羹, 大福, あんこスイーツ, こしあん, つぶあん',
      canonical: request.original_url,
      og: {
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        site_name: ''
      },
      twitter: {
        card: 'summary_large_image',
        site: '@',
        title: 'あんこねくと',
        description: :description,
        image: image_url('ogp.png')
      }
    }
  end
end
