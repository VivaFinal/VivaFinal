package web.dao.face;

import java.util.List;

import web.dto.Tag;

public interface SourceDao {

	public List<Tag> selectTagByGenre(String genre);


}
